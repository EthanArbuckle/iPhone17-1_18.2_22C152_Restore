@interface EXColorReference
+ (id)autoColorWithCallerClass:(Class)a3 resources:(id)a4;
+ (id)edColorReferenceFromXmlColorElement:(_xmlNode *)a3 callerClass:(Class)a4 state:(id)a5;
@end

@implementation EXColorReference

+ (id)edColorReferenceFromXmlColorElement:(_xmlNode *)a3 callerClass:(Class)a4 state:(id)a5
{
  v8 = [a5 resources];
  if (a3)
  {
    unint64_t v19 = 0;
    if (CXOptionalUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"indexed", &v19))
    {
      uint64_t v9 = +[EDColorReference colorReferenceWithColorIndex:v19 resources:v8];
    }
    else
    {
      double v18 = 0.0;
      CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"tint", &v18);
      if (!CXOptionalUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"theme", &v19))
      {
        id v17 = 0;
        BOOL v12 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"rgb", &v17);
        id v13 = v17;
        if (v12)
        {
          v14 = [MEMORY[0x263F08B08] scannerWithString:v13];
          [v14 scanHexInt:&v19];
          v15 = +[OITSUColor colorWithRGBValue:v19];
          v10 = +[EDColorReference colorReferenceWithColor:v15 resources:v8];
        }
        else
        {
          BOOL v16 = 0;
          CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"auto", &v16);
          if (v16)
          {
            v10 = [a1 autoColorWithCallerClass:a4 resources:v8];
          }
          else
          {
            v10 = 0;
          }
        }

        goto LABEL_8;
      }
      uint64_t v9 = +[EDColorReference colorReferenceWithThemeIndex:v19 tint:v8 resources:v18];
    }
  }
  else
  {
    uint64_t v9 = [a1 autoColorWithCallerClass:a4 resources:v8];
  }
  v10 = (void *)v9;
LABEL_8:

  return v10;
}

+ (id)autoColorWithCallerClass:(Class)a3 resources:(id)a4
{
  id v5 = a4;
  if ([(objc_class *)a3 isEqual:objc_opt_class()])
  {
    uint64_t v6 = 13;
  }
  else if ([(objc_class *)a3 isEqual:objc_opt_class()])
  {
    uint64_t v6 = 11;
  }
  else
  {
    uint64_t v6 = 33;
  }
  v7 = +[EDColorReference colorReferenceWithSystemColorID:v6 resources:v5];

  return v7;
}

@end