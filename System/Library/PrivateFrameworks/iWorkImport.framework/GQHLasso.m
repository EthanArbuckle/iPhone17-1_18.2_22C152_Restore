@interface GQHLasso
+ (Class)beginWorkspacePage:(id)a3 state:(id)a4;
+ (int)beginDocument:(id)a3 state:(id)a4;
+ (int)beginWorkspace:(const char *)a3 state:(id)a4;
+ (int)endDocument:(id)a3 state:(id)a4;
+ (int)endWorkspace:(id)a3;
+ (int)handleDrawableZOrder:(const char *)a3 state:(id)a4;
+ (int)handleStylesheet:(id)a3 state:(id)a4;
+ (int)handleWorkspaceStyle:(id)a3 state:(id)a4;
@end

@implementation GQHLasso

+ (int)beginDocument:(id)a3 state:(id)a4
{
  v5 = [[GQHLassoState alloc] initWithState:a4];
  [a4 setGeneratorState:v5];

  return 1;
}

+ (int)endDocument:(id)a3 state:(id)a4
{
  id v5 = objc_msgSend(a4, "generatorState", a3);
  objc_msgSend(objc_msgSend(v5, "htmlDoc"), "endElement");
  if ([v5 inProgressiveMode])
  {
    unsigned int v6 = [v5 writeIndexPageWithIFrame:a4];
  }
  else
  {
    objc_msgSend(v5, "writeIndexPageWithDocumentSize:", 1200.0, 960.0);
    unsigned int v6 = [v5 finishMainHtml];
  }
  if (v6) {
    return 1;
  }
  else {
    return 3;
  }
}

+ (int)handleStylesheet:(id)a3 state:(id)a4
{
  return 1;
}

+ (int)beginWorkspace:(const char *)a3 state:(id)a4
{
  id v6 = [a4 generatorState];
  objc_msgSend(objc_msgSend(a4, "outputBundle"), "setDocumentSize:", 1200.0, 960.0);
  [a4 outputBundle];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(objc_msgSend(a4, "outputBundle"), "startProgressiveData");
  }
  [v6 beginNewSheet:a3 processorState:a4];
  return 1;
}

+ (int)endWorkspace:(id)a3
{
  return 1;
}

+ (int)handleWorkspaceStyle:(id)a3 state:(id)a4
{
  return 1;
}

+ (Class)beginWorkspacePage:(id)a3 state:(id)a4
{
  return (Class)objc_opt_class();
}

+ (int)handleDrawableZOrder:(const char *)a3 state:(id)a4
{
  id v5 = [a4 generatorState];
  id v6 = [v5 cssZOrderClassForDrawableUid:a3];
  if (v6)
  {
    id v7 = v6;
    CFStringRef v8 = CFStringCreateWithFormat(0, 0, @".%@ {\nposition: relative; z-index: %u;\n}\n",
           v6,
           [v5 currentDrawableZOrder]);
    [v5 addStyle:v8 className:v7 srcStyle:0];
    CFRelease(v8);
  }
  return 1;
}

@end