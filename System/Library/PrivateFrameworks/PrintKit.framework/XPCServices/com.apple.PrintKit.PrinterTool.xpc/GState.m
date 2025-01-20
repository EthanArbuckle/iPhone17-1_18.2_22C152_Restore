@interface GState
- (NSString)nonStrokeColorspace;
- (NSString)strokeColorspace;
- (void)dealloc;
- (void)setNonStrokeColorspace:(id)a3;
- (void)setStrokeColorspace:(id)a3;
@end

@implementation GState

- (void)dealloc
{
  [(GState *)self setStrokeColorspace:0];
  [(GState *)self setNonStrokeColorspace:0];
  v3.receiver = self;
  v3.super_class = (Class)GState;
  [(GState *)&v3 dealloc];
}

- (NSString)strokeColorspace
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStrokeColorspace:(id)a3
{
}

- (NSString)nonStrokeColorspace
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNonStrokeColorspace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->nonStrokeColorspace, 0);

  objc_storeStrong((id *)&self->strokeColorspace, 0);
}

@end