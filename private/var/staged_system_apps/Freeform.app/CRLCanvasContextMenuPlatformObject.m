@interface CRLCanvasContextMenuPlatformObject
+ (id)platformObjectWithInteraction:(id)a3;
- (CRLCanvasContextMenuPlatformObject)initWithInteraction:(id)a3;
- (UIContextMenuInteraction)interaction;
- (void)setInteraction:(id)a3;
@end

@implementation CRLCanvasContextMenuPlatformObject

+ (id)platformObjectWithInteraction:(id)a3
{
  id v3 = a3;
  v4 = [[CRLCanvasContextMenuPlatformObject alloc] initWithInteraction:v3];

  return v4;
}

- (CRLCanvasContextMenuPlatformObject)initWithInteraction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLCanvasContextMenuPlatformObject;
  v6 = [(CRLCanvasContextMenuPlatformObject *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_interaction, a3);
  }

  return v7;
}

- (UIContextMenuInteraction)interaction
{
  return self->_interaction;
}

- (void)setInteraction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end