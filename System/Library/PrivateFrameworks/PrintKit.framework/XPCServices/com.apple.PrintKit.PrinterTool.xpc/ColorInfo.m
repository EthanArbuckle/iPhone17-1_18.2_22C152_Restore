@interface ColorInfo
- (ColorInfo)init;
- (NSMutableArray)gstateStack;
- (NSString)colorReason;
- (NSString)nonStrokeColorspace;
- (NSString)strokeColorspace;
- (void)dealloc;
- (void)grestore;
- (void)gsave;
- (void)setColorReason:(id)a3;
- (void)setGstateStack:(id)a3;
- (void)setNonStrokeColorspace:(id)a3;
- (void)setStrokeColorspace:(id)a3;
@end

@implementation ColorInfo

- (ColorInfo)init
{
  v9.receiver = self;
  v9.super_class = (Class)ColorInfo;
  v2 = [(ColorInfo *)&v9 init];
  v3 = v2;
  if (v2)
  {
    strokeColorspace = v2->strokeColorspace;
    v2->strokeColorspace = (NSString *)@"DeviceGray";

    nonStrokeColorspace = v3->nonStrokeColorspace;
    v3->nonStrokeColorspace = (NSString *)@"DeviceGray";

    uint64_t v6 = +[NSMutableArray arrayWithCapacity:5];
    gstateStack = v3->gstateStack;
    v3->gstateStack = (NSMutableArray *)v6;
  }
  return v3;
}

- (void)dealloc
{
  [(ColorInfo *)self setGstateStack:0];
  [(ColorInfo *)self setStrokeColorspace:0];
  [(ColorInfo *)self setNonStrokeColorspace:0];
  [(ColorInfo *)self setColorReason:0];
  v3.receiver = self;
  v3.super_class = (Class)ColorInfo;
  [(ColorInfo *)&v3 dealloc];
}

- (NSString)colorReason
{
  return self->colorReason;
}

- (void)setColorReason:(id)a3
{
  id v5 = a3;
  colorReason = self->colorReason;
  p_colorReason = &self->colorReason;
  if (!colorReason)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_colorReason, a3);
    id v5 = v8;
  }
}

- (void)gsave
{
  uint64_t v6 = objc_alloc_init(GState);
  objc_super v3 = [(ColorInfo *)self strokeColorspace];
  [(GState *)v6 setStrokeColorspace:v3];

  v4 = [(ColorInfo *)self nonStrokeColorspace];
  [(GState *)v6 setNonStrokeColorspace:v4];

  id v5 = [(ColorInfo *)self gstateStack];
  [v5 addObject:v6];
}

- (void)grestore
{
  objc_super v3 = [(ColorInfo *)self gstateStack];
  id v7 = [v3 lastObject];

  if (v7)
  {
    v4 = [v7 strokeColorspace];
    [(ColorInfo *)self setStrokeColorspace:v4];

    id v5 = [v7 nonStrokeColorspace];
    [(ColorInfo *)self setNonStrokeColorspace:v5];

    uint64_t v6 = [(ColorInfo *)self gstateStack];
    [v6 removeLastObject];
  }
  else
  {
    [(ColorInfo *)self setStrokeColorspace:@"DeviceGray"];
    [(ColorInfo *)self setNonStrokeColorspace:@"DeviceGray"];
  }
}

- (NSMutableArray)gstateStack
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setGstateStack:(id)a3
{
}

- (NSString)strokeColorspace
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStrokeColorspace:(id)a3
{
}

- (NSString)nonStrokeColorspace
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNonStrokeColorspace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->nonStrokeColorspace, 0);
  objc_storeStrong((id *)&self->strokeColorspace, 0);
  objc_storeStrong((id *)&self->gstateStack, 0);

  objc_storeStrong((id *)&self->colorReason, 0);
}

@end