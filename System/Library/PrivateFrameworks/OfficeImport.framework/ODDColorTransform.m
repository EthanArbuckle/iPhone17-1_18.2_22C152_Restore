@interface ODDColorTransform
- (ODDColorTransform)init;
- (id)labelForName:(id)a3;
- (void)setLabel:(id)a3 forName:(id)a4;
@end

@implementation ODDColorTransform

- (ODDColorTransform)init
{
  v6.receiver = self;
  v6.super_class = (Class)ODDColorTransform;
  v2 = [(ODDColorTransform *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mStyleLabels = v2->mStyleLabels;
    v2->mStyleLabels = v3;
  }
  return v2;
}

- (void)setLabel:(id)a3 forName:(id)a4
{
}

- (id)labelForName:(id)a3
{
  v3 = [(NSMutableDictionary *)self->mStyleLabels objectForKey:a3];
  return v3;
}

- (void).cxx_destruct
{
}

@end