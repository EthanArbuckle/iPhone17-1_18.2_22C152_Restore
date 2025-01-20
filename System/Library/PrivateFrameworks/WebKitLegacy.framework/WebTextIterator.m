@interface WebTextIterator
- (BOOL)atEnd;
- (WebTextIterator)initWithRange:(id)a3;
- (const)currentTextPointer;
- (id)currentNode;
- (id)currentRange;
- (id)currentText;
- (unint64_t)currentTextLength;
- (void)advance;
- (void)dealloc;
@end

@implementation WebTextIterator

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WebTextIterator;
  [(WebTextIterator *)&v3 dealloc];
}

- (WebTextIterator)initWithRange:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)WebTextIterator;
  v4 = [(WebTextIterator *)&v13 init];
  if (!v4) {
    return v4;
  }
  v4->_private = objc_alloc_init(WebTextIteratorPrivate);
  if (!a3) {
    return v4;
  }
  WebCore::makeSimpleRange();
  uint64_t v5 = WTF::fastMalloc((WTF *)0x100);
  WebCore::TextIterator::TextIterator();
  v6 = v4->_private;
  value = v6->_textIterator.__ptr_.__value_;
  v6->_textIterator.__ptr_.__value_ = (TextIterator *)v5;
  if (value)
  {
    v8 = (WTF *)MEMORY[0x1E4E44F70]();
    WTF::fastFree(v8, v9);
  }
  if (v12)
  {
    if (*((_DWORD *)v12 + 7) == 2)
    {
      if ((*((_WORD *)v12 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v12);
      }
    }
    else
    {
      *((_DWORD *)v12 + 7) -= 2;
    }
  }
  if (!v11) {
    return v4;
  }
  if (*((_DWORD *)v11 + 7) != 2)
  {
    *((_DWORD *)v11 + 7) -= 2;
    return v4;
  }
  if ((*((_WORD *)v11 + 17) & 0x400) != 0) {
    return v4;
  }
  WebCore::Node::removedLastRef(v11);
  return v4;
}

- (void)advance
{
  objc_super v3 = self->_private;
  value = (WebCore::TextIterator *)v3->_textIterator.__ptr_.__value_;
  if (value)
  {
    WebCore::TextIterator::advance(value);
    objc_super v3 = self->_private;
  }
  v3->_upconvertedText.m_size = 0;
}

- (BOOL)atEnd
{
  value = self->_private->_textIterator.__ptr_.__value_;
  return value && *((void *)value + 12) == 0;
}

- (id)currentRange
{
  value = self->_private->_textIterator.__ptr_.__value_;
  if (!value || !*((void *)value + 12)) {
    return 0;
  }
  WebCore::TextIterator::range((uint64_t *)&v11, (WebCore::TextIterator *)value);
  v15 = v11;
  int v16 = v12;
  objc_super v3 = v13;
  v11 = 0;
  objc_super v13 = 0;
  v17 = v3;
  int v18 = v14;
  char v19 = 1;
  WebCore::createLiveRange();
  v4 = kit(v20);
  uint64_t v5 = v20;
  v20 = 0;
  if (!v5)
  {
LABEL_6:
    if (!v19) {
      goto LABEL_21;
    }
LABEL_11:
    v7 = v17;
    v17 = 0;
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
    v8 = v15;
    v15 = 0;
    if (v8)
    {
      if (*((_DWORD *)v8 + 7) == 2)
      {
        if ((*((_WORD *)v8 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v8);
        }
      }
      else
      {
        *((_DWORD *)v8 + 7) -= 2;
      }
    }
    goto LABEL_21;
  }
  if (*((_DWORD *)v5 + 2) != 1)
  {
    --*((_DWORD *)v5 + 2);
    goto LABEL_6;
  }
  (*(void (**)(DOMObjectInternal *))(*(void *)v5 + 8))(v5);
  if (v19) {
    goto LABEL_11;
  }
LABEL_21:
  v9 = v13;
  objc_super v13 = 0;
  if (v9)
  {
    if (*((_DWORD *)v9 + 7) == 2)
    {
      if ((*((_WORD *)v9 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v9);
      }
    }
    else
    {
      *((_DWORD *)v9 + 7) -= 2;
    }
  }
  v10 = v11;
  v11 = 0;
  if (!v10) {
    return v4;
  }
  if (*((_DWORD *)v10 + 7) != 2)
  {
    *((_DWORD *)v10 + 7) -= 2;
    return v4;
  }
  if ((*((_WORD *)v10 + 17) & 0x400) != 0) {
    return v4;
  }
  WebCore::Node::removedLastRef(v10);
  return v4;
}

- (const)currentTextPointer
{
  uint64_t v2 = *((void *)self + 1);
  uint64_t v3 = *(void *)(v2 + 8);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = *(void *)(v3 + 152);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = *(const unsigned __int16 **)(v3 + 144);
  if ((v4 & 0xFF00000000) == 0) {
    return v5;
  }
  v6 = (unsigned __int8 *)(v2 + 28);
  if (*(_DWORD *)(v2 + 28)) {
    return *(const unsigned __int16 **)(v2 + 16);
  }
  v7 = self;
  v8 = *(WTF **)(v2 + 16);
  if (v4 <= (unint64_t)*(unsigned int *)(v2 + 24)) {
    goto LABEL_11;
  }
  if (!((unint64_t)v4 >> 31))
  {
    uint64_t v9 = WTF::fastMalloc((WTF *)(2 * v4));
    *(_DWORD *)(v2 + 24) = v4;
    *(void *)(v2 + 16) = v9;
    if (!v8)
    {
      v8 = (WTF *)v9;
      v11 = (unsigned __int8 *)v5 + v4;
      uint64_t v12 = *(unsigned int *)v6;
      if (v4 < 8uLL) {
        goto LABEL_12;
      }
LABEL_19:
      if (!__CFADD__(v12, v4 - 1) && !(((unint64_t)v4 - 1) >> 32))
      {
        unint64_t v16 = v2 + 32;
        v17 = (char *)v8 + 2 * v12;
        int v18 = (char *)v8 + 2 * v4 + 2 * v12;
        BOOL v19 = v6 >= (unsigned __int8 *)v18 || (unint64_t)v17 >= v16;
        BOOL v20 = !v19;
        BOOL v21 = v18 <= (char *)v5 || v17 >= (char *)v11;
        BOOL v22 = !v21;
        BOOL v23 = v16 <= (unint64_t)v5 || v6 >= v11;
        if (v23 && !v20 && !v22)
        {
          if (v4 >= 0x20uLL)
          {
            unint64_t v24 = v4 - (unint64_t)(v4 & 0x1F);
            int v25 = v12 + v24;
            v26 = (uint8x8_t *)(v5 + 8);
            unsigned int v27 = v12;
            unint64_t v28 = v24;
            do
            {
              v29 = (uint16x8_t *)((char *)v8 + 2 * v27);
              uint8x16_t v30 = *(uint8x16_t *)v26[-2].i8;
              uint16x8_t v31 = vmovl_u8(*v26);
              uint16x8_t v32 = vmovl_high_u8(*(uint8x16_t *)v26->i8);
              uint16x8_t *v29 = vmovl_u8(*(uint8x8_t *)v30.i8);
              v29[1] = vmovl_high_u8(v30);
              v29[2] = v31;
              v29[3] = v32;
              v26 += 4;
              v27 += 32;
              v28 -= 32;
            }
            while (v28);
            *(_DWORD *)v6 = v27;
            if ((v4 & 0x1F) == 0) {
              goto LABEL_14;
            }
            if ((v4 & 0x1Fu) < 8uLL)
            {
              int v14 = (const unsigned __int16 *)((char *)v5 + v24);
              unsigned int v13 = v12 + v24;
              do
              {
LABEL_13:
                __int16 v15 = *(unsigned __int8 *)v14;
                int v14 = (const unsigned __int16 *)((char *)v14 + 1);
                *((_WORD *)v8 + v13++) = v15;
                *(_DWORD *)v6 = v13;
              }
              while (v14 != (const unsigned __int16 *)v11);
LABEL_14:
              uint64_t v2 = *((void *)v7 + 1);
              return *(const unsigned __int16 **)(v2 + 16);
            }
          }
          else
          {
            unint64_t v24 = 0;
            int v25 = v12;
          }
          unint64_t v33 = v4 - (unint64_t)(v4 & 7);
          unsigned int v13 = v12 + v33;
          int v14 = (const unsigned __int16 *)((char *)v5 + v33);
          v34 = (uint8x8_t *)((char *)v5 + v24);
          uint64_t v35 = v24 + (v4 & 7) - v4;
          unsigned int v36 = v12 + v24;
          do
          {
            uint8x8_t v37 = *v34++;
            *(uint16x8_t *)((char *)v8 + 2 * v36) = vmovl_u8(v37);
            v36 += 8;
            v25 += 8;
            v35 += 8;
          }
          while (v35);
          *(_DWORD *)v6 = v25;
          if ((v4 & 7) == 0) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }
      }
LABEL_12:
      unsigned int v13 = v12;
      int v14 = v5;
      goto LABEL_13;
    }
    if ((WTF *)v9 == v8)
    {
      *(void *)(v2 + 16) = 0;
      *(_DWORD *)(v2 + 24) = 0;
    }
    WTF::fastFree(v8, v10);
    v8 = *(WTF **)(v2 + 16);
LABEL_11:
    v11 = (unsigned __int8 *)v5 + v4;
    uint64_t v12 = *(unsigned int *)v6;
    if (v4 < 8uLL) {
      goto LABEL_12;
    }
    goto LABEL_19;
  }
  __break(0xC471u);
  return self;
}

- (unint64_t)currentTextLength
{
  value = self->_private->_textIterator.__ptr_.__value_;
  if (value) {
    return *((unsigned int *)value + 38);
  }
  else {
    return 0;
  }
}

- (id)currentNode
{
  id result = self->_private->_textIterator.__ptr_.__value_;
  if (result)
  {
    uint64_t v3 = (WebCore::Node *)WebCore::TextIterator::node((WebCore::TextIterator *)result);
    return kit(v3);
  }
  return result;
}

- (id)currentText
{
  value = self->_private->_textIterator.__ptr_.__value_;
  if (!value) {
    return &stru_1F3C7DA90;
  }
  long long v7 = *((_OWORD *)value + 9);
  WTF::StringView::createNSString((uint64_t *)&cf, (WTF::StringView *)&v7);
  CFTypeRef v3 = cf;
  CFTypeRef cf = 0;
  CFTypeRef v4 = (id)CFMakeCollectable(v3);
  CFTypeRef v5 = cf;
  CFTypeRef cf = 0;
  if (v5) {
    CFRelease(v5);
  }
  return (id)v4;
}

@end