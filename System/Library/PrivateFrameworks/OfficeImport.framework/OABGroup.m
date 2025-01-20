@interface OABGroup
+ (id)readGroup:(id)a3 state:(id)a4;
@end

@implementation OABGroup

+ (id)readGroup:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (EshContentProperties *)[v5 eshGroup];
  if (!v7)
  {
    v11 = 0;
    goto LABEL_11;
  }
  if (!objc_msgSend((id)objc_msgSend(v6, "client"), "xmlEquivalentOfDrawableCanBeUsed")
    || !EshContentProperties::isXmlEquivalentSet(v7 + 12))
  {
    goto LABEL_10;
  }
  v8 = +[OABDrawable readDrawableFromZipPackageData:EshContentProperties::getXmlEquivalent(v7 + 12) foundInObject:v5 state:v6];
  uint64_t v9 = objc_opt_class();
  TSUDynamicCast(v9, (uint64_t)v8);
  v10 = (OADGroup *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {

LABEL_10:
    v11 = objc_alloc_init(OADGroup);
    +[OABContent readFromContainer:v5 toDrawable:v11 state:v6];
    var2 = (int *)v7[11].var2;
    -[OADGroup setLogicalBounds:](v11, "setLogicalBounds:", (double)var2[7], (double)var2[8], (double)(var2[9] - var2[7]), (double)(var2[10] - var2[8]));
    [v6 pushGroup:v11];
    v15 = +[OABDrawable readDrawablesFromContainer:v5 state:v6];
    [(OADGroup *)v11 addChildren:v15];

    id v16 = (id)[v6 popGroup];
    objc_msgSend((id)objc_msgSend(v6, "client"), "readClientDataFromGroup:toGroup:state:", v5, v11, v6);
    goto LABEL_11;
  }
  if (![(OADGroup *)v10 childCount])
  {
    [v6 pushGroup:v11];
    v12 = +[OABDrawable readDrawablesFromContainer:v5 state:v6];
    [(OADGroup *)v11 addChildren:v12];

    id v13 = (id)[v6 popGroup];
  }

LABEL_11:
  return v11;
}

@end