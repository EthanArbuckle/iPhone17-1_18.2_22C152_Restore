@interface RBImageQueueLayer
+ (id)defaultValueForKey:(id)a3;
- (id).cxx_construct;
- (id)actionForKey:(id)a3;
- (id)initWithSlots:(void *)a1;
@end

@implementation RBImageQueueLayer

- (id)actionForKey:(id)a3
{
  return 0;
}

+ (id)defaultValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"speed"]) {
    return &unk_26C4F6078;
  }
  if ([a3 isEqualToString:@"anchorPoint"])
  {
    v7[0] = 0;
    v7[1] = 0;
    return (id)[MEMORY[0x263F08D40] valueWithBytes:v7 objCType:"{CGPoint=dd}"];
  }
  else if (([a3 isEqualToString:@"needsLayoutOnGeometryChange"] & 1) != 0 {
         || ([a3 isEqualToString:@"allowsEdgeAntialiasing"] & 1) != 0)
  }
  {
    return (id)MEMORY[0x263EFFA80];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___RBImageQueueLayer;
    return objc_msgSendSuper2(&v6, sel_defaultValueForKey_, a3);
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

- (id)initWithSlots:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v4.receiver = a1;
  v4.super_class = (Class)RBImageQueueLayer;
  v1 = (id *)objc_msgSendSuper2(&v4, sel_init);
  if (v1)
  {
    v2 = -[RBImageQueueContents initWithSlots:]([RBImageQueueContents alloc]);

    v1[4] = v2;
    [v1 setContents:v1[4]];
    [v1 setContentsGravity:*MEMORY[0x263F15DF0]];
  }
  return v1;
}

- (void).cxx_destruct
{
}

@end