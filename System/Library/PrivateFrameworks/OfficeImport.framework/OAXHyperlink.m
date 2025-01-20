@interface OAXHyperlink
+ (id)readHyperlink:(_xmlNode *)a3 state:(id)a4;
@end

@implementation OAXHyperlink

+ (id)readHyperlink:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init(OADHyperlink);
  v8 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"tooltip", 0);
  [(OADHyperlink *)v7 setTooltip:v8];

  v9 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"action", 0);
  [(OADHyperlink *)v7 setAction:v9];

  [(OADHyperlink *)v7 setDoEndSound:CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"endSnd", 0)];
  [(OADHyperlink *)v7 setIsVisited:CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"highlightClick", 0)];
  [(OADHyperlink *)v7 setDoAddToHistory:CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"history", 1)];
  v10 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"invalidUrl", 0);
  [(OADHyperlink *)v7 setInvalidUrl:v10];

  v11 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"tgtFrame", 0);
  [(OADHyperlink *)v7 setTargetFrame:v11];

  v12 = [v6 packagePart];
  v13 = [v6 OCXReadRelationshipForNode:a3 packagePart:v12];

  if (v13)
  {
    v14 = [v13 targetLocation];
    v25 = [v14 scheme];
    v15 = [v14 relativePath];
    v16 = [v14 host];
    if (v15 && (unint64_t)[v15 length] >= 3)
    {
      v4 = [v15 substringToIndex:3];
      int v17 = 1;
      int v18 = 1;
      if ([v4 isEqualToString:@"www"]) {
        goto LABEL_13;
      }
      if (!v16) {
        goto LABEL_11;
      }
    }
    else
    {
      int v17 = 0;
      if (!v16) {
        goto LABEL_11;
      }
    }
    if ((unint64_t)[v16 length] >= 3)
    {
      v19 = [v16 substringToIndex:3];
      int v18 = [v19 isEqualToString:@"www"];

      if (!v17)
      {
LABEL_14:
        if (!v25 && v18)
        {
          id v20 = objc_alloc(NSURL);
          if (v16) {
            [NSString stringWithFormat:@"http://%@%@", v16, v15];
          }
          else {
          v21 = [NSString stringWithFormat:@"http://%@", v15];
          }
          v22 = (void *)[v20 initWithString:v21];

          [(OADHyperlink *)v7 setTargetLocation:v22];
          goto LABEL_21;
        }
LABEL_18:
        [(OADHyperlink *)v7 setTargetLocation:v14];
LABEL_21:
        -[OADHyperlink setTargetMode:](v7, "setTargetMode:", [v13 targetMode]);
        v23 = [v6 client];
        [v23 postprocessHyperlink:v7 relationship:v13 state:v6];

        goto LABEL_22;
      }
LABEL_13:

      goto LABEL_14;
    }
LABEL_11:
    if ((v17 & 1) == 0) {
      goto LABEL_18;
    }
    int v18 = 0;
    goto LABEL_13;
  }
LABEL_22:

  return v7;
}

@end