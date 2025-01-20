@interface DOMNodeIterator
- (BOOL)expandEntityReferences;
- (BOOL)pointerBeforeReferenceNode;
- (DOMNode)nextNode;
- (DOMNode)previousNode;
- (DOMNode)referenceNode;
- (DOMNode)root;
- (id)filter;
- (unsigned)whatToShow;
- (void)dealloc;
- (void)detach;
@end

@implementation DOMNodeIterator

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    if (self->super._internal)
    {
      [(DOMNodeIterator *)self detach];
      internal = self->super._internal;
      if (*((_DWORD *)internal + 2) == 1)
      {
        uint64_t v5 = MEMORY[0x1E4E44DC0]();
        MEMORY[0x1E4E44DD0](v5);
      }
      else
      {
        --*((_DWORD *)internal + 2);
      }
    }
    v6.receiver = self;
    v6.super_class = (Class)DOMNodeIterator;
    [(DOMObject *)&v6 dealloc];
  }
}

- (DOMNode)root
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMNode *)kit(*((WebCore::Node **)self->super._internal + 3));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (unsigned)whatToShow
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super._internal + 10);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (id)filter
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = kit(*((DOMObjectInternal **)self->super._internal + 4));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (BOOL)expandEntityReferences
{
  return 0;
}

- (DOMNode)referenceNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMNode *)kit(*((WebCore::Node **)self->super._internal + 6));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (BOOL)pointerBeforeReferenceNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = *((unsigned char *)self->super._internal + 56);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (DOMNode)nextNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WebCore::NodeIterator::nextNode((uint64_t *)v8, self->super._internal);
  int v4 = v9;
  if (v9)
  {
    uint64_t v5 = 0;
    if (v9 != -1) {
LABEL_3:
    }
      ((void (*)(char *, WebCore::Node **))off_1F3C7A208[v4])(&v11, v8);
  }
  else
  {
    v7 = v8[0];
    v8[0] = 0;
    uint64_t v5 = (DOMNode *)kit(v7);
    if (v7)
    {
      if (*((_DWORD *)v7 + 7) == 2)
      {
        if ((*((_WORD *)v7 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v7);
        }
      }
      else
      {
        *((_DWORD *)v7 + 7) -= 2;
      }
    }
    int v4 = v9;
    if (v9 != -1) {
      goto LABEL_3;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v3);
  return v5;
}

- (DOMNode)previousNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WebCore::NodeIterator::previousNode((uint64_t *)v8, self->super._internal);
  int v4 = v9;
  if (v9)
  {
    uint64_t v5 = 0;
    if (v9 != -1) {
LABEL_3:
    }
      ((void (*)(char *, WebCore::Node **))off_1F3C7A208[v4])(&v11, v8);
  }
  else
  {
    v7 = v8[0];
    v8[0] = 0;
    uint64_t v5 = (DOMNode *)kit(v7);
    if (v7)
    {
      if (*((_DWORD *)v7 + 7) == 2)
      {
        if ((*((_WORD *)v7 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v7);
        }
      }
      else
      {
        *((_DWORD *)v7 + 7) -= 2;
      }
    }
    int v4 = v9;
    if (v9 != -1) {
      goto LABEL_3;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v3);
  return v5;
}

- (void)detach
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3, v2);
}

@end