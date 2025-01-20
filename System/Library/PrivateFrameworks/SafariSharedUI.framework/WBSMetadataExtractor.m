@interface WBSMetadataExtractor
+ (id)metadataExtractorScriptSource;
- (JSContext)context;
- (WBSMetadataExtractor)initWithWebProcessPlugInFrame:(id)a3;
- (WBSMetadataExtractor)initWithWebProcessPlugInFrame:(id)a3 useNormalWorld:(BOOL)a4;
- (WKWebProcessPlugInFrame)webProcessPlugInFrame;
- (id)_colorFromColorComponents:(id)a3;
- (id)_resultForInvokingFunctionWithName:(id)a3;
- (id)appleTouchIconURLs;
- (id)faviconURLs;
- (id)firstElementForSelector:(id)a3;
- (id)makeContext;
- (void)dealloc;
- (void)getTemplateIconURL:(id *)a3 andColor:(id *)a4;
@end

@implementation WBSMetadataExtractor

+ (id)metadataExtractorScriptSource
{
  id v2 = [NSString alloc];
  v3 = objc_msgSend(v2, "initWithBytesNoCopy:length:encoding:freeWhenDone:", "//# sourceURL=__InjectedScript_MetadataExtractor.js\n/* Copyright (c) 2024 Apple Inc. All rights reserved. */\nfunction getIconType(e){var o=e.getAttribute(\"rel\");return\"apple-touch-icon\"===o?IconTypeAppleTouch"
                 "Icon:\"apple-touch-icon-precomposed\"===o?IconTypeAppleTouchIconPrecomposed:IconTypeFavicon}function co"
                 "mpareIconsDescending(e,o){var c=getIconType(e),t=getIconType(o);if (c===IconTypeFavicon&&t!==IconTypeFav"
                 "icon)return 1;if (t===IconTypeFavicon&&c!==IconTypeFavicon)return-1;var n=e.getAttribute(\"sizes\"),r=o."
                 "getAttribute(\"sizes\"),p=0,a=0;return n?p=parseInt(n):n||c!==IconTypeAppleTouchIcon&&c!==IconTypeApple"
                 "TouchIconPrecomposed||(p=AppleTouchIconDefaultWidth),r?a=parseInt(r):r||t!==IconTypeAppleTouchIcon&&t!="
                 "=IconTypeAppleTouchIconPrecomposed||(a=AppleTouchIconDefaultWidth),a>p?1:a<p?-1:c!==IconTypeAppleTouchI"
                 "conPrecomposed&&t===IconTypeAppleTouchIconPrecomposed?1:t!==IconTypeAppleTouchIconPrecomposed&&c===Icon"
                 "TypeAppleTouchIconPrecomposed?-1:0}function colorComponentsFromString(e){var o=document.createElement(\""
                 "canvas\");o.width=1,o.height=1;var c=o.getContext(\"2d\");c.fillStyle=e,c.fillRect(0,0,1,1);var t=c.get"
                 "ImageData(0,0,1,1);return[t.data[0],t.data[1],t.data[2]]}var MetadataExtractor=function(){};const IconT"
                 "ypeFavicon=0,IconTypeAppleTouchIcon=1,IconTypeAppleTouchIconPrecomposed=2,AppleTouchIconDefaultWidth=60"
                 ";MetadataExtractor.prototype={extractAndSortIconsWithSelector:function(e){var o=document.head.querySele"
                 "ctorAll(e);return o.length?Array.prototype.slice.call(o).sort(compareIconsDescending):[]},extractAppleT"
                 "ouchIconURLs:function(){for (var e=this.extractAndSortIconsWithSelector(\"link[rel=apple-touch-icon], li"
                 "nk[rel=apple-touch-icon-precomposed]\"),o=[],c=0;c<e.length;++c){var t=e[c].href;t&&o.push(t)}return o}"
                 ",extractFaviconURLs:function(){for (var e=this.extractAndSortIconsWithSelector(\"link[rel='shortcut icon"
                 "'], link[rel=icon]\"),o=[],c=e.length,t=0;t<c;++t)o.push(e[t].href);return o},extractTemplateIconURLAnd"
                 "Color:function(){var e=document.head.querySelector(\"link[rel=mask-icon]\");if (!e)return null;var o=e.g"
                 "etAttribute(\"color\");return o&&e.href?{url:e.href,color:colorComponentsFromString(o)}:null}};var Meta"
                 "dataExtractorJS=new MetadataExtractor;",
                 metadataExtractorSourceLength,
                 4,
                 0);
  return v3;
}

- (WBSMetadataExtractor)initWithWebProcessPlugInFrame:(id)a3
{
  return [(WBSMetadataExtractor *)self initWithWebProcessPlugInFrame:a3 useNormalWorld:0];
}

- (WBSMetadataExtractor)initWithWebProcessPlugInFrame:(id)a3 useNormalWorld:(BOOL)a4
{
  id v7 = a3;
  v8 = [(WBSMetadataExtractor *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_webProcessPlugInFrame, a3);
    if (a4) {
      [MEMORY[0x1E4F466E8] normalWorld];
    }
    else {
    uint64_t v10 = [MEMORY[0x1E4F466E8] world];
    }
    webProcessPlugInScriptWorld = v9->_webProcessPlugInScriptWorld;
    v9->_webProcessPlugInScriptWorld = (WKWebProcessPlugInScriptWorld *)v10;

    v12 = v9;
  }

  return v9;
}

- (void)dealloc
{
  [(WKWebProcessPlugInScriptWorld *)self->_webProcessPlugInScriptWorld clearWrappers];
  v3.receiver = self;
  v3.super_class = (Class)WBSMetadataExtractor;
  [(WBSMetadataExtractor *)&v3 dealloc];
}

- (id)makeContext
{
  return (id)[(WKWebProcessPlugInFrame *)self->_webProcessPlugInFrame jsContextForWorld:self->_webProcessPlugInScriptWorld];
}

- (JSContext)context
{
  context = self->_context;
  if (context)
  {
    objc_super v3 = context;
  }
  else
  {
    v5 = [(WBSMetadataExtractor *)self makeContext];
    v6 = self->_context;
    self->_context = v5;

    id v7 = [(id)objc_opt_class() metadataExtractorScriptSource];
    id v8 = [(JSContext *)self->_context evaluateScript:v7];
    objc_super v3 = self->_context;
  }
  return v3;
}

- (id)_resultForInvokingFunctionWithName:(id)a3
{
  id v4 = a3;
  v5 = [(WBSMetadataExtractor *)self context];
  v6 = [v5 globalObject];
  id v7 = [v6 valueForProperty:@"MetadataExtractorJS"];

  if (([v7 isUndefined] & 1) != 0
    || ([v7 valueForProperty:v4],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isUndefined],
        v8,
        (v9 & 1) != 0))
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [v7 invokeMethod:v4 withArguments:0];
  }

  return v10;
}

- (id)appleTouchIconURLs
{
  id v2 = [(WBSMetadataExtractor *)self _resultForInvokingFunctionWithName:@"extractAppleTouchIconURLs"];
  objc_super v3 = [v2 toArray];
  id v4 = objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_25);

  return v4;
}

id __42__WBSMetadataExtractor_appleTouchIconURLs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
    if (objc_msgSend(v3, "safari_isHTTPFamilyURL")) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)faviconURLs
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [(WBSMetadataExtractor *)self _resultForInvokingFunctionWithName:@"extractFaviconURLs"];
  objc_super v3 = [v2 toArray];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", v10, (void)v13);
          if (objc_msgSend(v11, "safari_isHTTPFamilyURL")) {
            [v4 addObject:v11];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_colorFromColorComponents:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 3)
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    [v4 doubleValue];
    double v6 = v5;

    uint64_t v7 = [v3 objectAtIndexedSubscript:1];
    [v7 doubleValue];
    double v9 = v8;

    uint64_t v10 = [v3 objectAtIndexedSubscript:2];
    [v10 doubleValue];
    double v12 = v11;

    long long v13 = [MEMORY[0x1E4F428B8] colorWithRed:v6 / 255.0 green:v9 / 255.0 blue:v12 / 255.0 alpha:1.0];
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (void)getTemplateIconURL:(id *)a3 andColor:(id *)a4
{
  *a3 = 0;
  *a4 = 0;
  id v12 = [(WBSMetadataExtractor *)self _resultForInvokingFunctionWithName:@"extractTemplateIconURLAndColor"];
  uint64_t v7 = [v12 toDictionary];
  double v8 = v7;
  if (v7)
  {
    double v9 = objc_msgSend(v7, "safari_stringForKey:", @"url");
    if ([v9 length])
    {
      id v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
      *a3 = v10;
    }
    else
    {
      *a3 = 0;
    }
    double v11 = objc_msgSend(v8, "safari_arrayForKey:", @"color");
    *a4 = [(WBSMetadataExtractor *)self _colorFromColorComponents:v11];
  }
}

- (id)firstElementForSelector:(id)a3
{
  id v4 = a3;
  double v5 = [(WBSMetadataExtractor *)self context];
  double v6 = [NSString stringWithFormat:@"document.querySelector('%@')", v4];

  uint64_t v7 = [v5 evaluateScript:v6];

  return v7;
}

- (WKWebProcessPlugInFrame)webProcessPlugInFrame
{
  return self->_webProcessPlugInFrame;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webProcessPlugInFrame, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_webProcessPlugInScriptWorld, 0);
}

@end