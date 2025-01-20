@interface TSKAnnotationAuthorStorage
- (BOOL)shouldDelayArchiving;
- (NSSet)authors;
- (id)authorWithName:(id)a3;
- (id)description;
- (id)nextAuthorColor;
- (id)packageLocator;
- (unsigned)delayedArchivingPriority;
- (void)addAuthor:(id)a3;
- (void)dealloc;
- (void)didLoadChildObjectFromDocumentSupport:(id)a3;
- (void)p_addAuthor:(id)a3 isFromDocumentSupport:(BOOL)a4;
- (void)removeAuthor:(id)a3;
@end

@implementation TSKAnnotationAuthorStorage

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKAnnotationAuthorStorage;
  [(TSKAnnotationAuthorStorage *)&v3 dealloc];
}

- (void)addAuthor:(id)a3
{
}

- (void)p_addAuthor:(id)a3 isFromDocumentSupport:(BOOL)a4
{
  if (-[TSKAnnotationAuthorStorage authorWithName:](self, "authorWithName:", [a3 name]))
  {
    if (!a4)
    {
      v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"-[TSKAnnotationAuthorStorage p_addAuthor:isFromDocumentSupport:]"];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthorStorage.mm"];
      [v8 handleFailureInFunction:v9 file:v10 lineNumber:44 description:@"Cannot have two authors with the same name in a collection!"];
    }
  }
  else
  {
    if (!a4) {
      [(TSPObject *)self willModify];
    }
    mAuthors = self->mAuthors;
    if (!mAuthors)
    {
      mAuthors = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      self->mAuthors = mAuthors;
    }
    [(NSMutableSet *)mAuthors addObject:a3];
  }
}

- (void)removeAuthor:(id)a3
{
  [(TSPObject *)self willModify];
  mAuthors = self->mAuthors;

  [(NSMutableSet *)mAuthors removeObject:a3];
}

- (id)authorWithName:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(TSKAnnotationAuthorStorage *)self authors];
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "name"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)nextAuthorColor
{
  NSUInteger v2 = [(NSSet *)[(TSKAnnotationAuthorStorage *)self authors] count];
  unint64_t v3 = v2 % +[TSKAnnotationAuthor presetColorCount];

  return +[TSKAnnotationAuthor authorStorageColorForIndex:v3];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<TSKAnnotationAuthorStorage: %p authors %@>", self, self->mAuthors];
}

- (BOOL)shouldDelayArchiving
{
  return 1;
}

- (unsigned)delayedArchivingPriority
{
  return 1000;
}

- (id)packageLocator
{
  return @"AnnotationAuthorStorage";
}

- (void)didLoadChildObjectFromDocumentSupport:(id)a3
{
}

- (NSSet)authors
{
  return &self->mAuthors->super;
}

@end