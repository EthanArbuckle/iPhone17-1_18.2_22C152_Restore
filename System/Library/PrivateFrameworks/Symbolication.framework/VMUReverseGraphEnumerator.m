@interface VMUReverseGraphEnumerator
- (VMUReverseGraphEnumerator)initWithGraph:(id)a3;
- (id)statusDisplayDescription;
@end

@implementation VMUReverseGraphEnumerator

- (VMUReverseGraphEnumerator)initWithGraph:(id)a3
{
  v4 = [a3 invertedGraph];
  v7.receiver = self;
  v7.super_class = (Class)VMUReverseGraphEnumerator;
  v5 = [(VMUGraphEnumerator *)&v7 initWithGraph:v4];

  return v5;
}

- (id)statusDisplayDescription
{
  return @"reverse";
}

@end