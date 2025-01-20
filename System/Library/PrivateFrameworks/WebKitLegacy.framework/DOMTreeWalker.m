@interface DOMTreeWalker
- (BOOL)expandEntityReferences;
- (DOMNode)currentNode;
- (DOMNode)firstChild;
- (DOMNode)lastChild;
- (DOMNode)nextNode;
- (DOMNode)nextSibling;
- (DOMNode)parentNode;
- (DOMNode)previousNode;
- (DOMNode)previousSibling;
- (DOMNode)root;
- (id)filter;
- (unsigned)whatToShow;
- (void)dealloc;
- (void)setCurrentNode:(DOMNode *)currentNode;
@end

@implementation DOMTreeWalker

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal) {
      WTF::RefCounted<WebCore::TreeWalker>::deref((void *)internal + 1);
    }
    v5.receiver = self;
    v5.super_class = (Class)DOMTreeWalker;
    [(DOMObject *)&v5 dealloc];
  }
}

- (DOMNode)root
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMNode *)kit(*((WebCore::Node **)self->super._internal + 2));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (unsigned)whatToShow
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super._internal + 8);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (id)filter
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = kit(*((DOMObjectInternal **)self->super._internal + 3));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (BOOL)expandEntityReferences
{
  return 0;
}

- (DOMNode)currentNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMNode *)kit(*((WebCore::Node **)self->super._internal + 5));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (void)setCurrentNode:(DOMNode *)currentNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  if (!currentNode || (internal = currentNode->super._internal) == 0) {
    raiseTypeErrorException();
  }
  WebCore::TreeWalker::setCurrentNode(self->super._internal, (Node *)internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v6);
}

- (DOMNode)parentNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::TreeWalker::parentNode((uint64_t *)v7, self->super._internal);
  int v4 = v8;
  if (!v8)
  {
    objc_super v5 = (DOMNode *)kit(v7[0]);
    int v4 = v8;
    if (v8 == -1) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  objc_super v5 = 0;
  if (v8 != -1) {
LABEL_3:
  }
    ((void (*)(char *, WebCore::Node **))off_1F3C7A298[v4])(&v10, v7);
LABEL_4:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return v5;
}

- (DOMNode)firstChild
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::TreeWalker::firstChild((uint64_t *)v7, self->super._internal);
  int v4 = v8;
  if (!v8)
  {
    objc_super v5 = (DOMNode *)kit(v7[0]);
    int v4 = v8;
    if (v8 == -1) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  objc_super v5 = 0;
  if (v8 != -1) {
LABEL_3:
  }
    ((void (*)(char *, WebCore::Node **))off_1F3C7A298[v4])(&v10, v7);
LABEL_4:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return v5;
}

- (DOMNode)lastChild
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::TreeWalker::lastChild((uint64_t *)v7, self->super._internal);
  int v4 = v8;
  if (!v8)
  {
    objc_super v5 = (DOMNode *)kit(v7[0]);
    int v4 = v8;
    if (v8 == -1) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  objc_super v5 = 0;
  if (v8 != -1) {
LABEL_3:
  }
    ((void (*)(char *, WebCore::Node **))off_1F3C7A298[v4])(&v10, v7);
LABEL_4:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return v5;
}

- (DOMNode)previousSibling
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  MEMORY[0x1E4E446D0](v7, self->super._internal);
  int v4 = v8;
  if (!v8)
  {
    objc_super v5 = (DOMNode *)kit(v7[0]);
    int v4 = v8;
    if (v8 == -1) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  objc_super v5 = 0;
  if (v8 != -1) {
LABEL_3:
  }
    ((void (*)(char *, WebCore::Node **))off_1F3C7A298[v4])(&v10, v7);
LABEL_4:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return v5;
}

- (DOMNode)nextSibling
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  MEMORY[0x1E4E446A0](v7, self->super._internal);
  int v4 = v8;
  if (!v8)
  {
    objc_super v5 = (DOMNode *)kit(v7[0]);
    int v4 = v8;
    if (v8 == -1) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  objc_super v5 = 0;
  if (v8 != -1) {
LABEL_3:
  }
    ((void (*)(char *, WebCore::Node **))off_1F3C7A298[v4])(&v10, v7);
LABEL_4:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return v5;
}

- (DOMNode)previousNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::TreeWalker::previousNode((uint64_t *)v7, self->super._internal);
  int v4 = v8;
  if (!v8)
  {
    objc_super v5 = (DOMNode *)kit(v7[0]);
    int v4 = v8;
    if (v8 == -1) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  objc_super v5 = 0;
  if (v8 != -1) {
LABEL_3:
  }
    ((void (*)(char *, WebCore::Node **))off_1F3C7A298[v4])(&v10, v7);
LABEL_4:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return v5;
}

- (DOMNode)nextNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::TreeWalker::nextNode((uint64_t *)v7, self->super._internal);
  int v4 = v8;
  if (!v8)
  {
    objc_super v5 = (DOMNode *)kit(v7[0]);
    int v4 = v8;
    if (v8 == -1) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  objc_super v5 = 0;
  if (v8 != -1) {
LABEL_3:
  }
    ((void (*)(char *, WebCore::Node **))off_1F3C7A298[v4])(&v10, v7);
LABEL_4:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return v5;
}

@end