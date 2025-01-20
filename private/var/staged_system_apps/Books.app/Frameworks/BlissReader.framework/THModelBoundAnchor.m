@interface THModelBoundAnchor
- (THModelBoundAnchor)initWithContentNode:(id)a3;
- (THModelBoundAnchor)initWithGlossaryEntry:(id)a3;
- (THModelContentNode)contentNode;
- (THModelGlossaryEntry)glossaryEntry;
- (void)dealloc;
- (void)setContentNode:(id)a3;
- (void)setGlossaryEntry:(id)a3;
@end

@implementation THModelBoundAnchor

- (THModelBoundAnchor)initWithContentNode:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THModelBoundAnchor;
  v4 = [(THModelBoundAnchor *)&v7 init];
  v5 = v4;
  if (v4) {
    [(THModelBoundAnchor *)v4 setContentNode:a3];
  }
  return v5;
}

- (THModelBoundAnchor)initWithGlossaryEntry:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THModelBoundAnchor;
  v4 = [(THModelBoundAnchor *)&v7 init];
  v5 = v4;
  if (v4) {
    [(THModelBoundAnchor *)v4 setGlossaryEntry:a3];
  }
  return v5;
}

- (void)dealloc
{
  [(THModelBoundAnchor *)self setContentNode:0];
  [(THModelBoundAnchor *)self setGlossaryEntry:0];
  v3.receiver = self;
  v3.super_class = (Class)THModelBoundAnchor;
  [(THModelBoundAnchor *)&v3 dealloc];
}

- (THModelContentNode)contentNode
{
  return self->mContentNode;
}

- (void)setContentNode:(id)a3
{
  self->mContentNode = (THModelContentNode *)a3;
}

- (THModelGlossaryEntry)glossaryEntry
{
  return self->mGlossaryEntry;
}

- (void)setGlossaryEntry:(id)a3
{
}

@end