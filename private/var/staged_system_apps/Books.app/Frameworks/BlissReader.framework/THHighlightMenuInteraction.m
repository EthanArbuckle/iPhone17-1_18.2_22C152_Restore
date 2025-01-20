@interface THHighlightMenuInteraction
- (NSString)annotationUUID;
- (THHighlightMenuInteraction)initWithAnnotationUUID:(id)a3 delegate:(id)a4;
- (void)setAnnotationUUID:(id)a3;
@end

@implementation THHighlightMenuInteraction

- (THHighlightMenuInteraction)initWithAnnotationUUID:(id)a3 delegate:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)THHighlightMenuInteraction;
  result = [(THHighlightMenuInteraction *)&v6 initWithDelegate:a4];
  result->_annotationUUID = (NSString *)a3;
  return result;
}

- (NSString)annotationUUID
{
  return self->_annotationUUID;
}

- (void)setAnnotationUUID:(id)a3
{
}

@end