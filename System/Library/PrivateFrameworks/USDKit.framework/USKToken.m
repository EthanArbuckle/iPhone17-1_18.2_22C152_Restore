@interface USKToken
+ (USKToken)tokenWithDataType:(id)a3;
+ (USKToken)tokenWithNodeType:(id)a3;
+ (USKToken)tokenWithRoleType:(id)a3;
+ (USKToken)tokenWithSchemaType:(id)a3;
+ (id)dataTypeWithTfToken:(TfToken)a3;
+ (id)nodeTypeWithTfToken:(TfToken)a3;
+ (id)roleTypeWithTfToken:(TfToken)a3;
+ (id)schemaTypeWithTfToken:(TfToken)a3;
- (BOOL)isEqual:(id)a3;
- (TfToken)token;
- (USKToken)init;
- (USKToken)initWithString:(id)a3;
- (USKToken)initWithTfToken:(TfToken)a3;
- (id).cxx_construct;
- (id)stringValue;
- (unint64_t)hash;
@end

@implementation USKToken

- (TfToken)token
{
  ptrAndBits = self->_token._rep._ptrAndBits;
  *v2 = (atomic_uint *)ptrAndBits;
  if ((ptrAndBits & 7) != 0)
  {
    v4 = (atomic_uint *)((unint64_t)ptrAndBits & 0xFFFFFFFFFFFFFFF8);
    if ((atomic_fetch_add_explicit(v4, 2u, memory_order_relaxed) & 1) == 0) {
      *v2 = v4;
    }
  }
  return (TfToken)self;
}

- (USKToken)init
{
  sub_234627B1C();
  v8.receiver = self;
  v8.super_class = (Class)USKToken;
  v3 = [(USKToken *)&v8 init];
  v4 = v3;
  if (v3)
  {
    ptrAndBits = v3->_token._rep._ptrAndBits;
    if ((ptrAndBits & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)ptrAndBits & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    v3->_token._rep._ptrAndBits = 0;
    v6 = v3;
  }

  return v4;
}

- (USKToken)initWithTfToken:(TfToken)a3
{
  sub_234627B1C();
  v9.receiver = self;
  v9.super_class = (Class)USKToken;
  v5 = [(USKToken *)&v9 init];
  v6 = v5;
  if (v5)
  {
    sub_2345EC46C(&v5->_token._rep._ptrAndBits, a3._rep._ptrAndBits);
    v7 = v6;
  }

  return v6;
}

- (USKToken)initWithString:(id)a3
{
  id v4 = a3;
  sub_234627B1C();
  v16.receiver = self;
  v16.super_class = (Class)USKToken;
  v5 = [(USKToken *)&v16 init];
  if (v5)
  {
    id v6 = v4;
    v10 = (char *)objc_msgSend_UTF8String(v6, v7, v8, v9);
    sub_2345DB968(__p, v10);
    MEMORY[0x237DC2540](&v15, __p);
    p_token = &v5->_token;
    if (&v15 == (_Rep **)&v5->_token)
    {
      if ((v15 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v15 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
    }
    else
    {
      if (((uint64_t)p_token->_rep._ptrAndBits & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)p_token->_rep._ptrAndBits & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      p_token->_rep._ptrAndBits = v15;
      v15 = 0;
    }
    if (v14 < 0) {
      operator delete(__p[0]);
    }
  }

  return v5;
}

+ (id)nodeTypeWithTfToken:(TfToken)a3
{
  v7[60] = *(uint64_t **)MEMORY[0x263EF8340];
  sub_234627B1C();
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2687AA530, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2687AA530))
  {
    operator new();
  }
  if ((void *)(qword_2687AA528 + 8) == sub_2346037C4(qword_2687AA528, (uint64_t *)a3._rep._ptrAndBits))
  {
    id v4 = (void **)USKNodeTypeUnknown;
  }
  else
  {
    v7[0] = (uint64_t *)a3._rep._ptrAndBits;
    id v4 = (void **)(sub_234603854((uint64_t **)qword_2687AA528, (uint64_t *)a3._rep._ptrAndBits, (uint64_t)&unk_23463AC00, v7)+ 5);
  }
  v5 = *v4;
  return v5;
}

+ (id)schemaTypeWithTfToken:(TfToken)a3
{
  v7[26] = *(uint64_t **)MEMORY[0x263EF8340];
  sub_234627B1C();
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2687AA540, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2687AA540))
  {
    operator new();
  }
  if ((void *)(qword_2687AA538 + 8) == sub_2346037C4(qword_2687AA538, (uint64_t *)a3._rep._ptrAndBits))
  {
    id v4 = (void **)USKSchemaTypeUnknown;
  }
  else
  {
    v7[0] = (uint64_t *)a3._rep._ptrAndBits;
    id v4 = (void **)(sub_234603854((uint64_t **)qword_2687AA538, (uint64_t *)a3._rep._ptrAndBits, (uint64_t)&unk_23463AC00, v7)+ 5);
  }
  v5 = *v4;
  return v5;
}

+ (id)roleTypeWithTfToken:(TfToken)a3
{
  v7[10] = *(uint64_t **)MEMORY[0x263EF8340];
  sub_234627B1C();
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2687AA550, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2687AA550))
  {
    operator new();
  }
  if ((void *)(qword_2687AA548 + 8) == sub_2346037C4(qword_2687AA548, (uint64_t *)a3._rep._ptrAndBits))
  {
    id v4 = (void **)USKRoleTypeNone;
  }
  else
  {
    v7[0] = (uint64_t *)a3._rep._ptrAndBits;
    id v4 = (void **)(sub_234603854((uint64_t **)qword_2687AA548, (uint64_t *)a3._rep._ptrAndBits, (uint64_t)&unk_23463AC00, v7)+ 5);
  }
  v5 = *v4;
  return v5;
}

+ (id)dataTypeWithTfToken:(TfToken)a3
{
  v7[88] = *(uint64_t **)MEMORY[0x263EF8340];
  sub_234627B1C();
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2687AA560, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2687AA560))
  {
    operator new();
  }
  if ((void *)(qword_2687AA558 + 8) == sub_2346037C4(qword_2687AA558, (uint64_t *)a3._rep._ptrAndBits))
  {
    id v4 = (void **)USKDataTypeUnknown;
  }
  else
  {
    v7[0] = (uint64_t *)a3._rep._ptrAndBits;
    id v4 = (void **)(sub_234603854((uint64_t **)qword_2687AA558, (uint64_t *)a3._rep._ptrAndBits, (uint64_t)&unk_23463AC00, v7)+ 5);
  }
  v5 = *v4;
  return v5;
}

+ (USKToken)tokenWithNodeType:(id)a3
{
  id v3 = a3;
  sub_234627B1C();
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2687AA578, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2687AA578))
  {
    qword_2687AA570 = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
    __cxa_guard_release(&qword_2687AA578);
  }
  if (qword_2687AA568 != -1) {
    dispatch_once(&qword_2687AA568, &unk_26E7640B8);
  }
  if (v3)
  {
    id v6 = objc_msgSend_objectForKeyedSubscript_((void *)qword_2687AA570, v4, (uint64_t)v3, v5);
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      uint64_t v9 = [USKToken alloc];
      id v10 = v3;
      uint64_t v14 = objc_msgSend_UTF8String(v10, v11, v12, v13);
      MEMORY[0x237DC2530](&v19, v14);
      id v8 = (id)objc_msgSend_initWithTfToken_(v9, v15, (uint64_t)&v19, v16);
      if ((v19 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v19 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      objc_msgSend_setObject_forKeyedSubscript_((void *)qword_2687AA570, v17, (uint64_t)v8, (uint64_t)v10);
    }
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_((void *)qword_2687AA570, v4, @"Unknown", v5);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (USKToken *)v8;
}

+ (USKToken)tokenWithRoleType:(id)a3
{
  id v3 = a3;
  sub_234627B1C();
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2687AA590, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2687AA590))
  {
    qword_2687AA588 = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
    __cxa_guard_release(&qword_2687AA590);
  }
  if (qword_2687AA580 != -1) {
    dispatch_once(&qword_2687AA580, &unk_26E7640D8);
  }
  if (v3)
  {
    id v6 = objc_msgSend_objectForKeyedSubscript_((void *)qword_2687AA588, v4, (uint64_t)v3, v5);
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      uint64_t v9 = [USKToken alloc];
      id v10 = v3;
      uint64_t v14 = objc_msgSend_UTF8String(v10, v11, v12, v13);
      MEMORY[0x237DC2530](&v19, v14);
      id v8 = (id)objc_msgSend_initWithTfToken_(v9, v15, (uint64_t)&v19, v16);
      if ((v19 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v19 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      objc_msgSend_setObject_forKeyedSubscript_((void *)qword_2687AA588, v17, (uint64_t)v8, (uint64_t)v10);
    }
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_((void *)qword_2687AA588, v4, @"None", v5);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (USKToken *)v8;
}

+ (USKToken)tokenWithDataType:(id)a3
{
  id v3 = a3;
  sub_234627B1C();
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2687AA5A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2687AA5A8))
  {
    qword_2687AA5A0 = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
    __cxa_guard_release(&qword_2687AA5A8);
  }
  if (qword_2687AA598 != -1) {
    dispatch_once(&qword_2687AA598, &unk_26E7640F8);
  }
  if (v3)
  {
    id v6 = objc_msgSend_objectForKeyedSubscript_((void *)qword_2687AA5A0, v4, (uint64_t)v3, v5);
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      uint64_t v9 = [USKToken alloc];
      id v10 = v3;
      uint64_t v14 = objc_msgSend_UTF8String(v10, v11, v12, v13);
      MEMORY[0x237DC2530](&v19, v14);
      id v8 = (id)objc_msgSend_initWithTfToken_(v9, v15, (uint64_t)&v19, v16);
      if ((v19 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v19 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      objc_msgSend_setObject_forKeyedSubscript_((void *)qword_2687AA5A0, v17, (uint64_t)v8, (uint64_t)v10);
    }
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_((void *)qword_2687AA5A0, v4, @"unknown", v5);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (USKToken *)v8;
}

+ (USKToken)tokenWithSchemaType:(id)a3
{
  id v3 = a3;
  sub_234627B1C();
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_2687AA5C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_2687AA5C0))
  {
    qword_2687AA5B8 = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
    __cxa_guard_release(&qword_2687AA5C0);
  }
  if (qword_2687AA5B0 != -1) {
    dispatch_once(&qword_2687AA5B0, &unk_26E764118);
  }
  if (v3)
  {
    id v6 = objc_msgSend_objectForKeyedSubscript_((void *)qword_2687AA5B8, v4, (uint64_t)v3, v5);
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      uint64_t v9 = [USKToken alloc];
      id v10 = v3;
      uint64_t v14 = objc_msgSend_UTF8String(v10, v11, v12, v13);
      MEMORY[0x237DC2530](&v19, v14);
      id v8 = (id)objc_msgSend_initWithTfToken_(v9, v15, (uint64_t)&v19, v16);
      if ((v19 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v19 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      objc_msgSend_setObject_forKeyedSubscript_((void *)qword_2687AA5B8, v17, (uint64_t)v8, (uint64_t)v10);
    }
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_((void *)qword_2687AA5B8, v4, @"Unknown", v5);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (USKToken *)v8;
}

- (id)stringValue
{
  ptrAndBits = self->_token._rep._ptrAndBits;
  if (ptrAndBits)
  {
    id v4 = NSString;
    unint64_t v5 = (unint64_t)ptrAndBits & 0xFFFFFFFFFFFFFFF8;
    if (v5) {
      uint64_t EmptyString = v5 + 16;
    }
    else {
      uint64_t EmptyString = pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString((pxrInternal__aapl__pxrReserved__::TfToken *)self);
    }
    if (*(char *)(EmptyString + 23) < 0) {
      uint64_t EmptyString = *(void *)EmptyString;
    }
    v7 = objc_msgSend_stringWithUTF8String_(v4, a2, EmptyString, v2);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (USKToken *)a3;
  unint64_t v5 = v4;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_token(v5, v6, v7, v8);
    BOOL v9 = ((unint64_t)self->_token._rep._ptrAndBits & 0xFFFFFFFFFFFFFFF8) == (v11 & 0xFFFFFFFFFFFFFFF8);
    if ((v11 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v11 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return bswap64(0x9E3779B97F4A7C55 * ((unint64_t)self->_token._rep._ptrAndBits & 0xFFFFFFFFFFFFFFF8));
}

- (void).cxx_destruct
{
  ptrAndBits = self->_token._rep._ptrAndBits;
  if ((ptrAndBits & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)ptrAndBits & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end