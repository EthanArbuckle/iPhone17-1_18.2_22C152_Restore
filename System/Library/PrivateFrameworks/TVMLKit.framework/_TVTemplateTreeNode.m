@interface _TVTemplateTreeNode
- (BOOL)isAbstract;
- (NSArray)derivedTemplateNodes;
- (NSArray)finalURLs;
- (NSArray)styleSheetURLs;
- (NSString)templateName;
- (_TVTemplateTreeNode)initWithTemplateName:(id)a3 styleSheetURLs:(id)a4;
- (_TVTemplateTreeNode)initWithTemplateName:(id)a3 styleSheetURLs:(id)a4 abstract:(BOOL)a5;
- (void)addDerivedTemplateNode:(id)a3;
- (void)setFinalURLs:(id)a3;
@end

@implementation _TVTemplateTreeNode

- (_TVTemplateTreeNode)initWithTemplateName:(id)a3 styleSheetURLs:(id)a4 abstract:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_TVTemplateTreeNode;
  v10 = [(_TVTemplateTreeNode *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    templateName = v10->_templateName;
    v10->_templateName = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    styleSheetURLs = v10->_styleSheetURLs;
    v10->_styleSheetURLs = (NSArray *)v13;

    v10->_isAbstract = a5;
  }

  return v10;
}

- (NSString)templateName
{
  return self->_templateName;
}

- (NSArray)styleSheetURLs
{
  return self->_styleSheetURLs;
}

- (void)setFinalURLs:(id)a3
{
}

- (BOOL)isAbstract
{
  return self->_isAbstract;
}

- (NSArray)derivedTemplateNodes
{
  v2 = (void *)[(NSMutableArray *)self->_derivedTemplateNodes copy];
  return (NSArray *)v2;
}

- (_TVTemplateTreeNode)initWithTemplateName:(id)a3 styleSheetURLs:(id)a4
{
  return [(_TVTemplateTreeNode *)self initWithTemplateName:a3 styleSheetURLs:a4 abstract:0];
}

- (void)addDerivedTemplateNode:(id)a3
{
  id v4 = a3;
  derivedTemplateNodes = self->_derivedTemplateNodes;
  id v8 = v4;
  if (!derivedTemplateNodes)
  {
    v6 = [MEMORY[0x263EFF980] array];
    v7 = self->_derivedTemplateNodes;
    self->_derivedTemplateNodes = v6;

    id v4 = v8;
    derivedTemplateNodes = self->_derivedTemplateNodes;
  }
  [(NSMutableArray *)derivedTemplateNodes addObject:v4];
}

- (NSArray)finalURLs
{
  return self->_finalURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalURLs, 0);
  objc_storeStrong((id *)&self->_styleSheetURLs, 0);
  objc_storeStrong((id *)&self->_templateName, 0);
  objc_storeStrong((id *)&self->_derivedTemplateNodes, 0);
}

@end