@interface TCVegaRenderer
+ (id)vegaJS;
+ (id)vegaliteJS;
+ (id)vg2canvasJS;
- (CGImage)CGImage;
- (JSContext)context;
- (NSString)spec;
- (TCVegaCGCanvas)vegaCanvas;
- (TCVegaJSDocument)vegaJSDocument;
- (TCVegaRenderer)init;
- (TCVegaRenderer)initWithSpec:(id)a3;
- (TCVegaRenderer)initWithSpec:(id)a3 config:(id)a4 scaleFactor:(double)a5;
- (double)scaleFactor;
- (id)cursor;
- (id)vegaContext;
- (unint64_t)height;
- (unint64_t)width;
- (void)setContext:(id)a3;
- (void)setScaleFactor:(double)a3;
- (void)setSpec:(id)a3;
- (void)setVegaCanvas:(id)a3;
- (void)setVegaJSDocument:(id)a3;
- (void)triggerEventWithType:(id)a3 event:(id)a4;
- (void)vegaContext;
@end

@implementation TCVegaRenderer

- (TCVegaRenderer)init
{
  return [(TCVegaRenderer *)self initWithSpec:0 config:0 scaleFactor:1.0];
}

- (TCVegaRenderer)initWithSpec:(id)a3
{
  return [(TCVegaRenderer *)self initWithSpec:a3 config:0 scaleFactor:2.0];
}

- (TCVegaRenderer)initWithSpec:(id)a3 config:(id)a4 scaleFactor:(double)a5
{
  v52[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (__CFString *)a4;
  v51.receiver = self;
  v51.super_class = (Class)TCVegaRenderer;
  v10 = [(TCVegaRenderer *)&v51 init];
  [(TCVegaRenderer *)v10 setSpec:v8];
  [(TCVegaRenderer *)v10 setScaleFactor:a5];
  id v11 = objc_alloc_init(MEMORY[0x263F10378]);
  [(TCVegaRenderer *)v10 setContext:v11];

  v12 = (void *)MEMORY[0x22A615770]();
  v13 = [(TCVegaRenderer *)v10 context];
  v14 = [v13 globalObject];
  v15 = [(TCVegaRenderer *)v10 context];
  [v15 setObject:v14 forKeyedSubscript:@"window"];

  v16 = NSNumber;
  [(TCVegaRenderer *)v10 scaleFactor];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  v18 = [(TCVegaRenderer *)v10 context];
  v19 = [v18 objectForKeyedSubscript:@"window"];
  [v19 setObject:v17 forKeyedSubscript:@"devicePixelRatio"];

  uint64_t v20 = objc_opt_class();
  v21 = [(TCVegaRenderer *)v10 context];
  [v21 setObject:v20 forKeyedSubscript:@"HTMLElement"];

  v22 = [(TCVegaRenderer *)v10 context];
  +[TCVegaJSConsole attachToJavaScriptContext:v22];

  v23 = objc_alloc_init(TCVegaCGCanvas);
  [(TCVegaRenderer *)v10 setVegaCanvas:v23];

  v24 = [TCVegaJSDocument alloc];
  v25 = [(TCVegaRenderer *)v10 vegaCanvas];
  v26 = [(TCVegaJSDocument *)v24 initWithCanvas:v25];

  [(TCVegaRenderer *)v10 setVegaJSDocument:v26];
  v27 = [(TCVegaRenderer *)v10 context];
  [v27 setObject:v26 forKeyedSubscript:@"document"];

  v28 = [[TCVegaHTMLElement alloc] initWithTagName:@"div"];
  v29 = [(TCVegaRenderer *)v10 context];
  [v29 setObject:v28 forKeyedSubscript:@"container"];

  v30 = (void *)MEMORY[0x263F10390];
  v31 = [(TCVegaRenderer *)v10 context];
  v32 = [v30 valueWithObject:&__block_literal_global_1 inContext:v31];
  v33 = [(TCVegaRenderer *)v10 context];
  [v33 setObject:v32 forKeyedSubscript:@"Image"];

  v34 = [(TCVegaRenderer *)v10 context];
  v35 = +[TCVegaRenderer vegaJS];
  id v36 = (id)[v34 evaluateScript:v35];

  v37 = [(TCVegaRenderer *)v10 context];
  v38 = +[TCVegaRenderer vegaliteJS];
  id v39 = (id)[v37 evaluateScript:v38];

  v40 = [(TCVegaRenderer *)v10 context];
  v41 = +[TCVegaRenderer vg2canvasJS];
  id v42 = (id)[v40 evaluateScript:v41];

  v43 = [(TCVegaRenderer *)v10 context];
  v44 = [v43 objectForKeyedSubscript:@"viewRender"];

  if (v10->spec)
  {
    v45 = &stru_26D78B520;
    if (v9) {
      v45 = v9;
    }
    v46 = v45;

    v47 = [(TCVegaRenderer *)v10 spec];
    v52[0] = v47;
    v52[1] = v46;
    v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
    id v49 = (id)[v44 callWithArguments:v48];

    v9 = v46;
  }

  return v10;
}

TCVegaCGImage *__50__TCVegaRenderer_initWithSpec_config_scaleFactor___block_invoke()
{
  v0 = objc_alloc_init(TCVegaCGImage);
  return v0;
}

- (id)vegaContext
{
  v3 = [(TCVegaRenderer *)self vegaCanvas];

  if (v3)
  {
    v4 = (void *)MEMORY[0x263F10390];
    v5 = [(TCVegaRenderer *)self vegaCanvas];
    v6 = [(TCVegaRenderer *)self context];
    v7 = [v4 valueWithObject:v5 inContext:v6];

    id v8 = [v7 toDictionary];
    if ([v8 count])
    {
      v9 = +[TCVegaLogger instance];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[TCVegaRenderer vegaContext](v8);
      }
    }
    v10 = [v7 invokeMethod:@"getContext" withArguments:&unk_26D796818];
    id v11 = [v10 toDictionary];
    if ([v11 count])
    {
      v12 = +[TCVegaLogger instance];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[TCVegaRenderer vegaContext](v11);
      }
    }
    v13 = [(TCVegaRenderer *)self vegaCanvas];
    v14 = [v13 getContext:@"2d"];
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (unint64_t)width
{
  v3 = [(TCVegaRenderer *)self vegaCanvas];
  v4 = [v3 context];
  [v4 width];
  double v6 = v5;
  [(TCVegaRenderer *)self scaleFactor];
  unint64_t v8 = (unint64_t)(v6 / v7);

  return v8;
}

- (unint64_t)height
{
  v3 = [(TCVegaRenderer *)self vegaCanvas];
  v4 = [v3 context];
  [v4 height];
  double v6 = v5;
  [(TCVegaRenderer *)self scaleFactor];
  unint64_t v8 = (unint64_t)(v6 / v7);

  return v8;
}

- (id)cursor
{
  v2 = [(TCVegaRenderer *)self vegaJSDocument];
  v3 = [v2 body];
  v4 = [v3 style];
  double v5 = [v4 cursor];

  return v5;
}

- (CGImage)CGImage
{
  v2 = [(TCVegaRenderer *)self vegaContext];
  Image = CGBitmapContextCreateImage((CGContextRef)[v2 context]);

  return Image;
}

- (void)triggerEventWithType:(id)a3 event:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(TCVegaRenderer *)self vegaCanvas];
  v9 = [v8 events];
  v10 = [v9 objectForKeyedSubscript:v6];

  if (v10)
  {
    id v11 = [(TCVegaRenderer *)self vegaCanvas];
    v12 = [v11 events];
    v13 = [v12 objectForKeyedSubscript:v6];
    v14 = [v13 value];

    v17[0] = v7;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    id v16 = (id)[v14 callWithArguments:v15];
  }
}

+ (id)vg2canvasJS
{
  return @"function viewRender(spec, config) {  config = config || {};  if (typeof config === 'string') {    config = JSON.parse(config);  }  if (typeof spec === 'string') {    spec = JSON.parse(spec);  }  const vlPrefix = 'https://vega.github.io/schema/vega-lite/';  const mode = spec['$schema'].startsWith(vlPrefix) ? 'vega-lite' : 'vega';  if (mode === 'vega-lite') {    spec = vl.compile(spec, { config: config }).spec;  }  const runtime = vega.parse(spec, mode === 'vega-lite' ? {} : config);  window.vegaView = new vega.View(runtime, {    logLevel: vega.Warn,    renderer: 'canvas',    hover: true  })  .initialize(container)  .runAsync()  .catch(err => { console.error(err); });}";
}

+ (id)vegaJS
{
  v2 = [MEMORY[0x263EFF8F8] dataWithBytes:&vega_5_4_0_min_js length:vega_5_4_0_min_js_len];
  v3 = (void *)[[NSString alloc] initWithData:v2 encoding:4];

  return v3;
}

+ (id)vegaliteJS
{
  v2 = [MEMORY[0x263EFF8F8] dataWithBytes:&vega_lite_3_3_0_min_js length:vega_lite_3_3_0_min_js_len];
  v3 = (void *)[[NSString alloc] initWithData:v2 encoding:4];

  return v3;
}

- (JSContext)context
{
  return (JSContext *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContext:(id)a3
{
}

- (NSString)spec
{
  return self->spec;
}

- (void)setSpec:(id)a3
{
}

- (TCVegaCGCanvas)vegaCanvas
{
  return self->vegaCanvas;
}

- (void)setVegaCanvas:(id)a3
{
}

- (TCVegaJSDocument)vegaJSDocument
{
  return self->vegaJSDocument;
}

- (void)setVegaJSDocument:(id)a3
{
}

- (double)scaleFactor
{
  return self->scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->scaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->vegaJSDocument, 0);
  objc_storeStrong((id *)&self->vegaCanvas, 0);
  objc_storeStrong((id *)&self->spec, 0);
  objc_storeStrong((id *)&self->context, 0);
}

- (void)vegaContext
{
  id v1 = [a1 debugDescription];
  [v1 UTF8String];
  OUTLINED_FUNCTION_0_0(&dword_223D44000, v2, v3, "Encountered extra properties on canvas: %s", v4, v5, v6, v7, 2u);
}

@end