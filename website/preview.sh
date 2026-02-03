#!/bin/bash
# Quick preview script for HSTR website

echo "================================"
echo "   HSTR Website Preview"
echo "================================"
echo ""

# Check if we're in the website directory
if [ ! -f "index.html" ]; then
    echo "❌ Error: Run this script from the website directory"
    exit 1
fi

echo "✅ Website files found!"
echo ""

# Check for Python
if command -v python3 &> /dev/null; then
    echo "🚀 Starting local web server..."
    echo ""
    echo "   Open your browser and navigate to:"
    echo "   👉 http://localhost:8000"
    echo ""
    echo "   Press Ctrl+C to stop the server"
    echo ""
    echo "================================"
    echo ""
    python3 -m http.server 8000
elif command -v python &> /dev/null; then
    echo "🚀 Starting local web server..."
    echo ""
    echo "   Open your browser and navigate to:"
    echo "   👉 http://localhost:8000"
    echo ""
    echo "   Press Ctrl+C to stop the server"
    echo ""
    echo "================================"
    echo ""
    python -m SimpleHTTPServer 8000
else
    echo "ℹ️  Python not found. Opening index.html directly..."
    echo ""
    
    # Try to open in default browser
    if command -v xdg-open &> /dev/null; then
        xdg-open index.html
        echo "✅ Opened in default browser"
    elif command -v open &> /dev/null; then
        open index.html
        echo "✅ Opened in default browser"
    else
        echo "📁 Open this file manually:"
        echo "   $(pwd)/index.html"
    fi
fi
