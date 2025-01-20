@interface EXTableFilter
+ (id)edTableFilterFromXmlTableFilterElement:(_xmlNode *)a3 state:(id)a4;
+ (int)edFilterOperatorFromXmlOperatorString:(id)a3;
@end

@implementation EXTableFilter

+ (id)edTableFilterFromXmlTableFilterElement:(_xmlNode *)a3 state:(id)a4
{
  if (a3)
  {
    v6 = objc_alloc_init(EDTableFilter);
    id v12 = 0;
    BOOL v7 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"operator", &v12);
    id v8 = v12;
    if (v7) {
      uint64_t v9 = [a1 edFilterOperatorFromXmlOperatorString:v8];
    }
    else {
      uint64_t v9 = 1;
    }
    [(EDTableFilter *)v6 setOperatorType:v9];
    double v11 = 0.0;
    if (CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v11)) {
      [(EDTableFilter *)v6 setValue:v11];
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (int)edFilterOperatorFromXmlOperatorString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_12;
  }
  if (([v3 isEqualToString:@"notEqual"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"greaterThanOrEqual"])
    {
      int v5 = 3;
      goto LABEL_13;
    }
    if ([v4 isEqualToString:@"greaterThan"])
    {
      int v5 = 4;
      goto LABEL_13;
    }
    if ([v4 isEqualToString:@"lessThan"])
    {
      int v5 = 5;
      goto LABEL_13;
    }
    if ([v4 isEqualToString:@"lessThanOrEqual"])
    {
      int v5 = 6;
      goto LABEL_13;
    }
LABEL_12:
    int v5 = 1;
    goto LABEL_13;
  }
  int v5 = 2;
LABEL_13:

  return v5;
}

@end