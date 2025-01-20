@interface IMMutableArrayController
- (IMMutableArrayController)initWithContent:(id)a3;
- (NSMutableArray)content;
- (id)arrangeObjects:(id)a3;
- (void)rearrangeObjects;
@end

@implementation IMMutableArrayController

- (IMMutableArrayController)initWithContent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMMutableArrayController;
  v6 = [(IMMutableArrayController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_content, a3);
  }

  return v7;
}

- (void)rearrangeObjects
{
  id v5 = [(IMMutableArrayController *)self content];
  id v3 = [v5 copy];
  v4 = [(IMMutableArrayController *)self arrangeObjects:v3];
  [(IMArrayController *)self setArrangedObjects:v4];
}

- (id)arrangeObjects:(id)a3
{
  id v3 = a3;

  return v3;
}

- (NSMutableArray)content
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end