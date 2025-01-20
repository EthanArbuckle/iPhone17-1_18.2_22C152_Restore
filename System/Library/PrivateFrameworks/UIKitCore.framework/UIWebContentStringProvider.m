@interface UIWebContentStringProvider
+ (NSArray)additionalLeadingReadableTypeIdentifiersForItemProvider;
+ (NSArray)additionalTrailingReadableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 requestedClass:(Class)a5 error:(id *)a6;
@end

@implementation UIWebContentStringProvider

+ (NSArray)additionalLeadingReadableTypeIdentifiersForItemProvider
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

+ (NSArray)additionalTrailingReadableTypeIdentifiersForItemProvider
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [(id)*MEMORY[0x1E4F44538] identifier];
  v6[0] = v2;
  v3 = [(id)*MEMORY[0x1E4F443F0] identifier];
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return (NSArray *)v4;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 requestedClass:(Class)a5 error:(id *)a6
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:a4 allowUndeclared:1];
  if ([v10 conformsToType:*MEMORY[0x1E4F44538]])
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v12 = *(void *)off_1E52D2448;
    uint64_t v13 = *(void *)off_1E52D2070;
    v27[0] = *(void *)off_1E52D1FC0;
    v27[1] = v13;
    v28[0] = v12;
    v28[1] = MEMORY[0x1E4F1CC28];
    v14 = (void *)MEMORY[0x1E4F1C9E8];
    v15 = v28;
    v16 = v27;
LABEL_5:
    v19 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:2];
    v20 = (void *)[v11 _initWithHTMLData:v9 options:v19 documentAttributes:0 error:a6];

    if (v20)
    {
      id v21 = [a5 alloc];
      v22 = [v20 string];
      v23 = (void *)[v21 initWithString:v22];
    }
    else
    {
      v23 = 0;
    }

    goto LABEL_10;
  }
  if ([v10 conformsToType:*MEMORY[0x1E4F443F0]])
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v17 = *(void *)off_1E52D2078;
    uint64_t v18 = *(void *)off_1E52D2070;
    v25[0] = *(void *)off_1E52D1FC0;
    v25[1] = v18;
    v26[0] = v17;
    v26[1] = MEMORY[0x1E4F1CC28];
    v14 = (void *)MEMORY[0x1E4F1C9E8];
    v15 = v26;
    v16 = v25;
    goto LABEL_5;
  }
  v23 = 0;
LABEL_10:

  return v23;
}

@end