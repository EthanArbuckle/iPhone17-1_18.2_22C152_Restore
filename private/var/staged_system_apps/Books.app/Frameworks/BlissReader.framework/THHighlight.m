@interface THHighlight
- (NSArray)lines;
- (THAnnotation)annotation;
- (void)dealloc;
- (void)setAnnotation:(id)a3;
- (void)setLines:(id)a3;
@end

@implementation THHighlight

- (void)dealloc
{
  [(THHighlight *)self setAnnotation:0];
  [(THHighlight *)self setLines:0];
  v3.receiver = self;
  v3.super_class = (Class)THHighlight;
  [(THHighlight *)&v3 dealloc];
}

- (NSArray)lines
{
  return self->_lines;
}

- (void)setLines:(id)a3
{
}

- (THAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
}

@end