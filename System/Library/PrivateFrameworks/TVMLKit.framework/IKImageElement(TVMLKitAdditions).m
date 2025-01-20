@interface IKImageElement(TVMLKitAdditions)
- (double)tv_imageScaleToSize;
- (id)tv_imageProxyWithLayout:()TVMLKitAdditions;
- (id)tv_resourceImage;
- (id)tv_symbolImage;
- (id)tv_urlWithLayout:()TVMLKitAdditions;
- (id)tv_urlWithSize:()TVMLKitAdditions focusSizeIncrease:;
- (id)tv_urlWithSize:()TVMLKitAdditions focusSizeIncrease:centerGrowth:cropCode:;
- (uint64_t)tv_associatedViewElement;
- (uint64_t)tv_imageProxy;
- (uint64_t)tv_imageType;
- (uint64_t)tv_isResource;
- (uint64_t)tv_isSymbol;
@end

@implementation IKImageElement(TVMLKitAdditions)

- (uint64_t)tv_associatedViewElement
{
  uint64_t v2 = objc_opt_class();
  return objc_msgSend(a1, "tv_associatedViewElementWithDefaultClass:", v2);
}

- (uint64_t)tv_isResource
{
  v1 = [a1 url];
  uint64_t v2 = objc_msgSend(v1, "tv_isResourceURL");

  return v2;
}

- (id)tv_resourceImage
{
  v1 = [a1 url];
  if (objc_msgSend(v1, "tv_isResourceURL"))
  {
    uint64_t v2 = +[TVInterfaceFactory sharedInterfaceFactory];
    v3 = objc_msgSend(v1, "tv_resourceName");
    v4 = [v2 imageForResource:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)tv_isSymbol
{
  v1 = [a1 url];
  uint64_t v2 = objc_msgSend(v1, "tv_isSymbolURL");

  return v2;
}

- (id)tv_symbolImage
{
  v1 = [a1 url];
  if (objc_msgSend(v1, "tv_isSymbolURL"))
  {
    uint64_t v2 = (void *)MEMORY[0x263F1C6B0];
    v3 = objc_msgSend(v1, "tv_symbolName");
    v4 = [v2 systemImageNamed:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)tv_imageProxyWithLayout:()TVMLKitAdditions
{
  v4 = +[TVImageLayout layoutWithLayout:a3 element:a1];
  v5 = objc_msgSend(a1, "tv_urlWithLayout:", v4);
  if (!objc_msgSend(v5, "tv_isResourceURL")
    || (+[TVInterfaceFactory sharedInterfaceFactory],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v4 decoratorSize],
        objc_msgSend(v6, "_imageProxyForResourceURL:scaleToSize:", v5),
        v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    if (!objc_msgSend(v5, "tv_isSymbolURL")) {
      goto LABEL_12;
    }
    v8 = +[TVInterfaceFactory sharedInterfaceFactory];
    v9 = [v4 imageSymbolConfiguration];
    [v4 decoratorSize];
    v7 = objc_msgSend(v8, "_imageProxyForSymbolURL:imageSymbolConfiguration:scaleToSize:", v5, v9);

    if (!v7)
    {
LABEL_12:
      v10 = +[TVInterfaceFactory sharedInterfaceFactory];
      v7 = [v10 _imageProxyFromElement:a1 withLayout:v4];

      if (!v7)
      {
        v7 = +[TVViewFactory imageProxyWithURL:v5];
      }
    }
  }

  return v7;
}

- (uint64_t)tv_imageProxy
{
  return objc_msgSend(a1, "tv_imageProxyWithLayout:", 0);
}

- (double)tv_imageScaleToSize
{
  uint64_t v2 = +[TVImageLayout layoutWithLayout:0 element:a1];
  [v2 decoratorSize];
  double v4 = v3;
  double v6 = v5;
  v7 = objc_msgSend(a1, "tv_urlWithLayout:", v2);
  v8 = v7;
  if (v4 == *MEMORY[0x263F001B0] && v6 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    if (objc_msgSend(v7, "tv_isResourceURL"))
    {
      v10 = +[TVInterfaceFactory sharedInterfaceFactory];
      v11 = objc_msgSend(v8, "tv_resourceName");
      uint64_t v12 = [v10 imageForResource:v11];
    }
    else
    {
      if (!objc_msgSend(v8, "tv_isSymbolURL")) {
        goto LABEL_12;
      }
      v13 = (void *)MEMORY[0x263F1C6B0];
      v10 = objc_msgSend(v8, "tv_symbolName");
      v11 = [v2 imageSymbolConfiguration];
      uint64_t v12 = [v13 systemImageNamed:v10 withConfiguration:v11];
    }
    v14 = (void *)v12;

    if (v14)
    {
      [v14 size];
      double v4 = v15;
    }
  }
LABEL_12:

  return v4;
}

- (uint64_t)tv_imageType
{
  v1 = [a1 elementName];
  if ([v1 isEqualToString:@"img"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"fullscreenImg"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"decorationImage"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"heroImg"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)tv_urlWithSize:()TVMLKitAdditions focusSizeIncrease:centerGrowth:cropCode:
{
  id v12 = a7;
  v13 = [a1 attributes];
  v14 = [v13 objectForKeyedSubscript:@"isTemplated"];

  if ([v14 length]
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v14 BOOLValue])
  {
    double v15 = [a1 attributes];
    v16 = [v15 objectForKeyedSubscript:@"src"];

    if ([v16 length])
    {
      v17 = [a1 attributes];
      v18 = [v17 objectForKeyedSubscript:@"format"];

      id v19 = -[TVURLDescription initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:]([TVURLDescription alloc], "initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:", v16, v12, v18, a2, a3, a4);
      [v19 setCenterGrowth:a6];
      v20 = +[TVViewFactory imageURLWithDescription:v19];
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v20 = [a1 url];
  }

  return v20;
}

- (id)tv_urlWithSize:()TVMLKitAdditions focusSizeIncrease:
{
  v8 = [a1 attributes];
  v9 = [v8 objectForKeyedSubscript:@"cropCode"];

  v10 = objc_msgSend(a1, "tv_urlWithSize:focusSizeIncrease:centerGrowth:cropCode:", 0, v9, a2, a3, a4);

  return v10;
}

- (id)tv_urlWithLayout:()TVMLKitAdditions
{
  id v4 = a3;
  [v4 decoratorSize];
  if (v5 == 0.0 || ([v4 decoratorSize], v6 == 0.0))
  {
    v7 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG)) {
      -[IKImageElement(TVMLKitAdditions) tv_urlWithLayout:](v7);
    }
  }
  v8 = [a1 attributes];
  v9 = [v8 objectForKeyedSubscript:@"cropCode"];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v4 cropCode];
  }
  id v12 = v11;

  [v4 decoratorSize];
  double v14 = v13;
  double v16 = v15;
  [v4 focusSizeIncrease];
  v18 = objc_msgSend(a1, "tv_urlWithSize:focusSizeIncrease:centerGrowth:cropCode:", objc_msgSend(v4, "centerGrowth"), v12, v14, v16, v17);

  return v18;
}

- (void)tv_urlWithLayout:()TVMLKitAdditions .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_230B4C000, log, OS_LOG_TYPE_DEBUG, "Image layout decorator size is 0", v1, 2u);
}

@end