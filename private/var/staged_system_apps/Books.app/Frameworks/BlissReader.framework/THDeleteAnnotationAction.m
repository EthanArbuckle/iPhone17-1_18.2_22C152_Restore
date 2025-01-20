@interface THDeleteAnnotationAction
- (THDeleteAnnotationAction)initWithAnnotation:(id)a3;
- (void)commitWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5;
- (void)dealloc;
- (void)redoWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5;
- (void)undoWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5;
@end

@implementation THDeleteAnnotationAction

- (THDeleteAnnotationAction)initWithAnnotation:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THDeleteAnnotationAction;
  v4 = [(THDeleteAnnotationAction *)&v6 init];
  if (v4) {
    v4->_annotationUuid = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationUuid"), "copy");
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THDeleteAnnotationAction;
  [(THDeleteAnnotationAction *)&v3 dealloc];
}

- (void)commitWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5
{
  id v6 = [a4 annotationForUUID:self->_annotationUuid includeDeleted:0 moc:a5];
  if (v6)
  {
    v7 = v6;
    [v6 setAnnotationDeleted:1];
    id v8 = [v7 annotationUuid];
    id v9 = [v7 annotationContentNodeID];
    [a3 registerAnnotationDeletedWithUUID:v8 fromContentNodeWithID:v9];
  }
}

- (void)undoWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5
{
  id v6 = [a4 annotationForUUID:self->_annotationUuid includeDeleted:1 moc:a5];
  if (v6)
  {
    v7 = v6;
    [v6 setAnnotationDeleted:0];
    id v8 = [v7 annotationUuid];
    id v9 = [v7 annotationContentNodeID];
    [a3 registerAnnotationAddedWithUUID:v8 toContentNodeWithID:v9];
  }
}

- (void)redoWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5
{
  id v6 = [a4 annotationForUUID:self->_annotationUuid includeDeleted:1 moc:a5];
  if (v6)
  {
    v7 = v6;
    [v6 setAnnotationDeleted:1];
    id v8 = [v7 annotationUuid];
    id v9 = [v7 annotationContentNodeID];
    [a3 registerAnnotationDeletedWithUUID:v8 fromContentNodeWithID:v9];
  }
}

@end