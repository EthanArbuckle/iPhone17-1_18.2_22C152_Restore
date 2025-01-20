@interface PFXXmlStackEntry
+ (id)createFromReader:(id)a3 elementInfo:(id)a4 parentEntry:(id)a5 cfiPath:(id)a6 readerState:(id)a7;
- (NSString)cfiPath;
- (PFXXmlStackEntry)initWithParentEntry:(id)a3 reader:(id)a4 elementName:(const char *)a5 elementNamespace:(const char *)a6 cfiPath:(id)a7 readerState:(id)a8;
- (PFXXmlStackEntry)parentEntry;
- (PFXXmlStreamReaderState)readerState;
- (const)childElementNameAtIndex:(unint64_t)a3;
- (const)childPairAtIndex:(unint64_t)a3;
- (const)elementNamespace;
- (const)xmlAttributes;
- (const)xmlElementId;
- (const)xmlElementName;
- (const)xmlValueForAttribute:(const char *)a3;
- (id).cxx_construct;
- (id)childResultAtIndex:(unint64_t)a3;
- (id)firstChildResultWithElementName:(const char *)a3;
- (id)nonDelegatedReader;
- (id)pfxStringForAttribute:(const char *)a3;
- (id)reader;
- (id)result;
- (id)valueForAttribute:(const char *)a3;
- (unint64_t)childResultCount;
- (void)addAttributeName:(const char *)a3 withValue:(id)a4;
- (void)addResultFromChildEntry:(id)a3;
- (void)dealloc;
- (void)setElementId:(const char *)a3;
- (void)setResult:(id)a3;
@end

@implementation PFXXmlStackEntry

- (void)setElementId:(const char *)a3
{
  self->mElementId = (char *)xmlStrdup((const xmlChar *)a3);
}

- (PFXXmlStackEntry)initWithParentEntry:(id)a3 reader:(id)a4 elementName:(const char *)a5 elementNamespace:(const char *)a6 cfiPath:(id)a7 readerState:(id)a8
{
  if (!a5) {
    return 0;
  }
  v18.receiver = self;
  v18.super_class = (Class)PFXXmlStackEntry;
  v14 = [(PFXXmlStackEntry *)&v18 init];
  v15 = v14;
  if (v14)
  {
    v14->mReaderState = (PFXXmlStreamReaderState *)a8;
    v14->mReader = (PFXElementReader *)a4;
    v15->mParentEntry = (PFXXmlStackEntry *)a3;
    v16 = (NSString *)a7;
    v15->mElementId = 0;
    v15->mElementName = a5;
    v15->mElementNamespace = a6;
    v15->mCfiPath = v16;
  }
  return v15;
}

- (void)dealloc
{
  begin_node = (PFXXmlStackEntry *)self->mXmlAttributes.__tree_.__begin_node_;
  if (begin_node != (PFXXmlStackEntry *)&self->mXmlAttributes.__tree_.__pair1_)
  {
    do
    {

      mParentEntry = begin_node->mParentEntry;
      if (mParentEntry)
      {
        do
        {
          mReaderState = mParentEntry;
          mParentEntry = (PFXXmlStackEntry *)mParentEntry->super.isa;
        }
        while (mParentEntry);
      }
      else
      {
        do
        {
          mReaderState = (PFXXmlStackEntry *)begin_node->mReaderState;
          BOOL v6 = mReaderState->super.isa == (Class)begin_node;
          begin_node = mReaderState;
        }
        while (!v6);
      }
      begin_node = mReaderState;
    }
    while (mReaderState != (PFXXmlStackEntry *)&self->mXmlAttributes.__tree_.__pair1_);
  }
  for (i = (void **)self->mChildResults.__begin_; i != self->mChildResults.__end_; i += 2)
  {
    xmlFree(*i);
  }
  mElementId = self->mElementId;
  if (mElementId) {
    xmlFree(mElementId);
  }
  v9.receiver = self;
  v9.super_class = (Class)PFXXmlStackEntry;
  [(PFXXmlStackEntry *)&v9 dealloc];
}

- (const)xmlElementName
{
  return self->mElementName;
}

- (const)xmlElementId
{
  return self->mElementId;
}

- (const)elementNamespace
{
  return self->mElementNamespace;
}

- (id)reader
{
  mReader = self->mReader;
  do
  {
    v3 = mReader;
    if (![(PFXElementReader *)mReader conformsToProtocol:&OBJC_PROTOCOL___PFXElementReaderDelegate])break; {
    mReader = (PFXElementReader *)[(PFXElementReader *)v3 delegate];
    }
  }
  while (mReader != v3);
  return v3;
}

- (id)nonDelegatedReader
{
  return self->mReader;
}

- (id)pfxStringForAttribute:(const char *)a3
{
  BOOL v6 = (const xmlChar *)a3;
  v4 = (PFXXmlStackEntry *)sub_1EE660((uint64_t)&self->mXmlAttributes, &v6);
  if (&self->mXmlAttributes.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, PFXString *>, void *>>> *)v4) {
    return 0;
  }
  else {
    return v4->mChildResults.__begin_;
  }
}

- (id)valueForAttribute:(const char *)a3
{
  id result = [(PFXXmlStackEntry *)self pfxStringForAttribute:a3];
  if (result)
  {
    return [result nsString];
  }
  return result;
}

- (const)xmlValueForAttribute:(const char *)a3
{
  id result = [(PFXXmlStackEntry *)self pfxStringForAttribute:a3];
  if (result)
  {
    return (const char *)[(id)result xmlString];
  }
  return result;
}

- (const)xmlAttributes
{
  return &self->mXmlAttributes;
}

- (unint64_t)childResultCount
{
  return ((char *)self->mChildResults.__end_ - (char *)self->mChildResults.__begin_) >> 4;
}

- (const)childPairAtIndex:(unint64_t)a3
{
  begin = (char *)self->mChildResults.__begin_;
  uint64_t v4 = (char *)self->mChildResults.__end_ - (char *)begin;
  v5 = &begin[16 * a3];
  if (a3 >= v4 >> 4) {
    return 0;
  }
  else {
    return v5;
  }
}

- (const)childElementNameAtIndex:(unint64_t)a3
{
  id result = [(PFXXmlStackEntry *)self childPairAtIndex:a3];
  if (result) {
    return *(const char **)result;
  }
  return result;
}

- (id)childResultAtIndex:(unint64_t)a3
{
  id result = [(PFXXmlStackEntry *)self childPairAtIndex:a3];
  if (result) {
    return (id)*((void *)result + 1);
  }
  return result;
}

- (id)firstChildResultWithElementName:(const char *)a3
{
  begin = (id *)self->mChildResults.__begin_;
  if (begin == self->mChildResults.__end_) {
    return 0;
  }
  while (!xmlStrEqual((const xmlChar *)*begin, (const xmlChar *)a3))
  {
    begin += 2;
    if (begin == self->mChildResults.__end_) {
      return 0;
    }
  }
  return begin[1];
}

- (void)addResultFromChildEntry:(id)a3
{
  if ([a3 xmlElementName] && objc_msgSend(a3, "result"))
  {
    v5 = xmlStrdup((const xmlChar *)[a3 xmlElementName]);
    BOOL v6 = (xmlChar *)[a3 result];
    value = (char *)self->mChildResults.__end_cap_.__value_;
    end = (char *)self->mChildResults.__end_;
    if (end >= value)
    {
      begin = self->mChildResults.__begin_;
      uint64_t v11 = (end - begin) >> 4;
      unint64_t v12 = v11 + 1;
      if ((unint64_t)(v11 + 1) >> 60) {
        sub_3D1D0();
      }
      uint64_t v13 = value - begin;
      if (v13 >> 3 > v12) {
        unint64_t v12 = v13 >> 3;
      }
      if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v12;
      }
      if (v14) {
        v15 = (char *)sub_3D278((uint64_t)&self->mChildResults.__end_cap_, v14);
      }
      else {
        v15 = 0;
      }
      v16 = (xmlChar **)&v15[16 * v11];
      v17 = &v15[16 * v14];
      NSString *v16 = v5;
      v16[1] = v6;
      objc_super v9 = v16 + 2;
      v19 = (char *)self->mChildResults.__begin_;
      objc_super v18 = (char *)self->mChildResults.__end_;
      if (v18 != v19)
      {
        do
        {
          *((_OWORD *)v16 - 1) = *((_OWORD *)v18 - 1);
          v16 -= 2;
          v18 -= 16;
        }
        while (v18 != v19);
        objc_super v18 = (char *)self->mChildResults.__begin_;
      }
      self->mChildResults.__begin_ = v16;
      self->mChildResults.__end_ = v9;
      self->mChildResults.__end_cap_.__value_ = v17;
      if (v18) {
        operator delete(v18);
      }
    }
    else
    {
      *(void *)end = v5;
      *((void *)end + 1) = v6;
      objc_super v9 = end + 16;
    }
    self->mChildResults.__end_ = v9;
  }
}

- (PFXXmlStackEntry)parentEntry
{
  return self->mParentEntry;
}

- (PFXXmlStreamReaderState)readerState
{
  return self->mReaderState;
}

- (id)result
{
  return self->mResult;
}

- (void)setResult:(id)a3
{
}

- (NSString)cfiPath
{
  return self->mCfiPath;
}

- (void).cxx_destruct
{
  sub_43C90((uint64_t)&self->mXmlAttributes, (void *)self->mXmlAttributes.__tree_.__pair1_.__value_.__left_);
  begin = self->mChildResults.__begin_;
  if (begin)
  {
    self->mChildResults.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = (char *)self + 72;
  return self;
}

- (void)addAttributeName:(const char *)a3 withValue:(id)a4
{
  v7 = (const xmlChar *)a3;
  if (xmlStrEqual((const xmlChar *)"id", (const xmlChar *)a3))
  {
    self->mElementId = (char *)xmlStrdup((const xmlChar *)[a4 xmlString]);
  }
  else
  {
    id v6 = a4;
    v8 = &v7;
    sub_1EB8AC((uint64_t **)&self->mXmlAttributes, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)[5] = (uint64_t)v6;
  }
}

+ (id)createFromReader:(id)a3 elementInfo:(id)a4 parentEntry:(id)a5 cfiPath:(id)a6 readerState:(id)a7
{
  unint64_t v12 = (xmlTextReader *)[a7 streamAPI];
  uint64_t v13 = v12;
  if (a4)
  {
    unint64_t v14 = (const xmlChar *)[a4 elementName];
    v15 = (const xmlChar *)[a4 elementNamespace];
  }
  else
  {
    unint64_t v14 = xmlTextReaderConstLocalName(v12);
    v15 = xmlTextReaderConstNamespaceUri(v13);
  }
  id v16 = [objc_alloc((Class)objc_opt_class()) initWithParentEntry:a5 reader:a3 elementName:v14 elementNamespace:v15 cfiPath:a6 readerState:a7];
  if (xmlTextReaderMoveToFirstAttribute(v13) == 1)
  {
    while (1)
    {
      v17 = xmlTextReaderConstLocalName(v13);
      objc_super v18 = xmlTextReaderConstValue(v13);
      if (![a7 isRawAttribute:v17]) {
        break;
      }
      v19 = [[PFXString alloc] initWithXmlString:v18];
LABEL_28:
      [v16 addAttributeName:v17 withValue:v19];

      if (xmlTextReaderMoveToNextAttribute(v13) != 1) {
        goto LABEL_29;
      }
    }
    int v20 = xmlStrlen(v18);
    v21 = malloc_type_malloc(v20 + 1, 0xBEA6A94DuLL);
    __darwin_ct_rune_t v22 = *v18;
    v23 = v21;
    if (!*v18)
    {
LABEL_27:
      unsigned char *v23 = 0;
      v19 = [[PFXString alloc] initWithXmlString:v21];
      free(v21);
      goto LABEL_28;
    }
    v23 = v21;
    while (1)
    {
      while ((v22 & 0x80) != 0)
      {
        if (__maskrune(v22, 0x4000uLL)) {
          goto LABEL_11;
        }
LABEL_14:
        __darwin_ct_rune_t v25 = *v18;
        if (!*v18) {
          goto LABEL_27;
        }
        if (v23 == v21)
        {
          v23 = v21;
        }
        else
        {
          *v23++ = 32;
          __darwin_ct_rune_t v25 = *v18;
          if (!*v18) {
            goto LABEL_27;
          }
        }
        uint64_t v26 = 0;
        while (1)
        {
          __uint32_t v27 = (v25 & 0x80) != 0 ? __maskrune(v25, 0x4000uLL) : _DefaultRuneLocale.__runetype[v25] & 0x4000;
          __darwin_ct_rune_t v22 = v18[v26];
          if (v27) {
            break;
          }
          v23[v26] = v22;
          __darwin_ct_rune_t v25 = v18[++v26];
          if (!v25)
          {
            v23 += v26;
            goto LABEL_27;
          }
        }
        v23 += v26;
        v18 += v26;
        if (!v22) {
          goto LABEL_27;
        }
      }
      if ((_DefaultRuneLocale.__runetype[v22] & 0x4000) == 0) {
        goto LABEL_14;
      }
LABEL_11:
      __darwin_ct_rune_t v24 = *++v18;
      __darwin_ct_rune_t v22 = v24;
      if (!v24) {
        goto LABEL_27;
      }
    }
  }
LABEL_29:
  xmlTextReaderMoveToElement(v13);
  return v16;
}

@end