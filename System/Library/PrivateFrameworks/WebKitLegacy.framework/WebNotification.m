@interface WebNotification
- (WebNotification)init;
- (WebNotification)initWithCoreNotification:(void *)a3;
- (id)body;
- (id)dir;
- (id)iconURL;
- (id)lang;
- (id)notificationID;
- (id)origin;
- (id)tag;
- (id)title;
- (void)dealloc;
- (void)dispatchClickEvent;
- (void)dispatchCloseEvent;
- (void)dispatchErrorEvent;
- (void)dispatchShowEvent;
- (void)finalize;
@end

@implementation WebNotification

- (WebNotification)initWithCoreNotification:(void *)a3
{
  v51.receiver = self;
  v51.super_class = (Class)WebNotification;
  v4 = [(WebNotification *)&v51 init];
  if (!v4) {
    return v4;
  }
  v5 = objc_alloc_init(WebNotificationPrivate);
  v6 = v5;
  v4->_private = v5;
  if (!*(&v5[1]._internal.var0.__engaged_ + 48))
  {
    unint64_t v12 = *(void *)a3;
    *(void *)a3 = 0;
    v5->_internal.var0.contextIdentifier.var0.m_processIdentifier.m_identifier = v12;
    unsigned int v13 = *((_DWORD *)&v5->_internal.var0.__val_.defaultActionURL + 2) & 0xFFFFFFFE | *((_DWORD *)a3 + 2) & 1;
    *((_DWORD *)&v5->_internal.var0.__val_.defaultActionURL + 2) = v13;
    unsigned int v14 = v13 & 0xFFFFFFFD | (2 * ((*((_DWORD *)a3 + 2) >> 1) & 1));
    *((_DWORD *)&v5->_internal.var0.__val_.defaultActionURL + 2) = v14;
    unsigned int v15 = v14 & 0xFFFFFFFB | (4 * ((*((_DWORD *)a3 + 2) >> 2) & 1));
    *((_DWORD *)&v5->_internal.var0.__val_.defaultActionURL + 2) = v15;
    unsigned int v16 = v15 & 0xFFFFFFC7 | (8 * ((*((_DWORD *)a3 + 2) >> 3) & 7));
    *((_DWORD *)&v5->_internal.var0.__val_.defaultActionURL + 2) = v16;
    *((_DWORD *)&v5->_internal.var0.__val_.defaultActionURL + 2) = *((_DWORD *)a3 + 2) & 0xFFFFFFC0 | v16 & 0x3F;
    *(_OWORD *)(&v5->_internal.var0.__engaged_ + 12) = *(_OWORD *)((char *)a3 + 12);
    *(void *)(&v5->_internal.var0.__engaged_ + 28) = *(void *)((char *)a3 + 28);
    v5->_internal.var0.__val_.defaultActionURL.m_queryEnd = *((_DWORD *)a3 + 9);
    *((_DWORD *)a3 + 2) &= ~1u;
    v17 = (StringImpl *)*((void *)a3 + 5);
    *((void *)a3 + 5) = 0;
    v5->_internal.var0.__val_.title.m_impl.m_ptr = v17;
    v18 = (StringImpl *)*((void *)a3 + 6);
    *((void *)a3 + 6) = 0;
    v5->_internal.var0.__val_.body.m_impl.m_ptr = v18;
    v19 = (StringImpl *)*((void *)a3 + 7);
    *((void *)a3 + 7) = 0;
    v5->_internal.var0.__val_.iconURL.m_impl.m_ptr = v19;
    v20 = (StringImpl *)*((void *)a3 + 8);
    *((void *)a3 + 8) = 0;
    v5->_internal.var0.__val_.tag.m_impl.m_ptr = v20;
    v21 = (StringImpl *)*((void *)a3 + 9);
    *((void *)a3 + 9) = 0;
    v5->_internal.var0.__val_.language.m_impl.m_ptr = v21;
    v5->_internal.var0.__val_.direction = *((unsigned char *)a3 + 80);
    v22 = (StringImpl *)*((void *)a3 + 11);
    *((void *)a3 + 11) = 0;
    v5->_internal.var0.__val_.originString.m_impl.m_ptr = v22;
    v23 = (StringImpl *)*((void *)a3 + 12);
    *((void *)a3 + 12) = 0;
    v5->_internal.var0.__val_.serviceWorkerRegistrationURL.m_string.m_impl.m_ptr = v23;
    unsigned int v24 = *((_DWORD *)&v5->_internal.var0.__val_.serviceWorkerRegistrationURL + 2) & 0xFFFFFFFE | *((_DWORD *)a3 + 26) & 1;
    *((_DWORD *)&v5->_internal.var0.__val_.serviceWorkerRegistrationURL + 2) = v24;
    unsigned int v25 = v24 & 0xFFFFFFFD | (2 * ((*((_DWORD *)a3 + 26) >> 1) & 1));
    *((_DWORD *)&v5->_internal.var0.__val_.serviceWorkerRegistrationURL + 2) = v25;
    unsigned int v26 = v25 & 0xFFFFFFFB | (4 * ((*((_DWORD *)a3 + 26) >> 2) & 1));
    *((_DWORD *)&v5->_internal.var0.__val_.serviceWorkerRegistrationURL + 2) = v26;
    unsigned int v27 = v26 & 0xFFFFFFC7 | (8 * ((*((_DWORD *)a3 + 26) >> 3) & 7));
    *((_DWORD *)&v5->_internal.var0.__val_.serviceWorkerRegistrationURL + 2) = v27;
    *((_DWORD *)&v5->_internal.var0.__val_.serviceWorkerRegistrationURL + 2) = *((_DWORD *)a3 + 26) & 0xFFFFFFC0 | v27 & 0x3F;
    *(_OWORD *)(&v5->_internal.var0.__engaged_ + 108) = *(_OWORD *)((char *)a3 + 108);
    *(void *)(&v5->_internal.var0.__engaged_ + 124) = *(void *)((char *)a3 + 124);
    v5->_internal.var0.__val_.serviceWorkerRegistrationURL.m_queryEnd = *((_DWORD *)a3 + 33);
    *((_DWORD *)a3 + 26) &= ~1u;
    long long v28 = *((_OWORD *)a3 + 10);
    long long v29 = *((_OWORD *)a3 + 11);
    long long v30 = *((_OWORD *)a3 + 13);
    *(_OWORD *)&v5[1].super.isa = *((_OWORD *)a3 + 12);
    *(_OWORD *)&v5[1]._internal.var0.__null_state_ = v30;
    *(_OWORD *)&v5->_internal.creationTime.m_value = v28;
    *(_OWORD *)&v5->_internal.data.m_capacity = v29;
    *((_OWORD *)&v5->_internal.var0.__engaged_ + 9) = *((_OWORD *)a3 + 9);
    *((void *)&v5[1]._internal.var0.__engaged_ + 2) = 0;
    *((void *)&v5[1]._internal.var0.__engaged_ + 3) = 0;
    uint64_t v31 = *((void *)a3 + 28);
    *((void *)a3 + 28) = 0;
    *((void *)&v5[1]._internal.var0.__engaged_ + 2) = v31;
    LODWORD(v31) = *((_DWORD *)a3 + 58);
    *((_DWORD *)a3 + 58) = 0;
    v5[1]._internal.var0.__val_.defaultActionURL.m_hostEnd = v31;
    LODWORD(v31) = *((_DWORD *)a3 + 59);
    *((_DWORD *)a3 + 59) = 0;
    v5[1]._internal.var0.__val_.defaultActionURL.m_pathAfterLastSlash = v31;
    *((_WORD *)&v5[1]._internal.var0.__engaged_ + 16) = *((_WORD *)a3 + 120);
    *(&v5[1]._internal.var0.__engaged_ + 48) = 1;
    return v4;
  }
  WTF::URL::operator=((uint64_t)&v5->_internal, (uint64_t *)a3);
  v8 = (StringImpl *)*((void *)a3 + 5);
  *((void *)a3 + 5) = 0;
  m_ptr = (WTF::StringImpl *)v6->_internal.var0.__val_.title.m_impl.m_ptr;
  v6->_internal.var0.__val_.title.m_impl.m_ptr = v8;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2)
    {
      WTF::StringImpl::destroy(m_ptr, v7);
      v33 = (StringImpl *)*((void *)a3 + 6);
      *((void *)a3 + 6) = 0;
      v11 = (WTF::StringImpl *)v6->_internal.var0.__val_.body.m_impl.m_ptr;
      v6->_internal.var0.__val_.body.m_impl.m_ptr = v33;
      if (!v11) {
        goto LABEL_13;
      }
      goto LABEL_11;
    }
    *(_DWORD *)m_ptr -= 2;
  }
  v10 = (StringImpl *)*((void *)a3 + 6);
  *((void *)a3 + 6) = 0;
  v11 = (WTF::StringImpl *)v6->_internal.var0.__val_.body.m_impl.m_ptr;
  v6->_internal.var0.__val_.body.m_impl.m_ptr = v10;
  if (!v11)
  {
LABEL_13:
    v34 = (StringImpl *)*((void *)a3 + 7);
    *((void *)a3 + 7) = 0;
    v35 = (WTF::StringImpl *)v6->_internal.var0.__val_.iconURL.m_impl.m_ptr;
    v6->_internal.var0.__val_.iconURL.m_impl.m_ptr = v34;
    if (!v35) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
LABEL_11:
  if (*(_DWORD *)v11 != 2)
  {
    *(_DWORD *)v11 -= 2;
    goto LABEL_13;
  }
  WTF::StringImpl::destroy(v11, v7);
  v36 = (StringImpl *)*((void *)a3 + 7);
  *((void *)a3 + 7) = 0;
  v35 = (WTF::StringImpl *)v6->_internal.var0.__val_.iconURL.m_impl.m_ptr;
  v6->_internal.var0.__val_.iconURL.m_impl.m_ptr = v36;
  if (!v35) {
    goto LABEL_18;
  }
LABEL_16:
  if (*(_DWORD *)v35 == 2)
  {
    WTF::StringImpl::destroy(v35, v7);
    v39 = (StringImpl *)*((void *)a3 + 8);
    *((void *)a3 + 8) = 0;
    v38 = (WTF::StringImpl *)v6->_internal.var0.__val_.tag.m_impl.m_ptr;
    v6->_internal.var0.__val_.tag.m_impl.m_ptr = v39;
    if (!v38) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  *(_DWORD *)v35 -= 2;
LABEL_18:
  v37 = (StringImpl *)*((void *)a3 + 8);
  *((void *)a3 + 8) = 0;
  v38 = (WTF::StringImpl *)v6->_internal.var0.__val_.tag.m_impl.m_ptr;
  v6->_internal.var0.__val_.tag.m_impl.m_ptr = v37;
  if (!v38)
  {
LABEL_23:
    v40 = (StringImpl *)*((void *)a3 + 9);
    *((void *)a3 + 9) = 0;
    v41 = (WTF::StringImpl *)v6->_internal.var0.__val_.language.m_impl.m_ptr;
    v6->_internal.var0.__val_.language.m_impl.m_ptr = v40;
    if (!v41) {
      goto LABEL_29;
    }
LABEL_26:
    if (*(_DWORD *)v41 == 2) {
      WTF::StringImpl::destroy(v41, v7);
    }
    else {
      *(_DWORD *)v41 -= 2;
    }
    goto LABEL_29;
  }
LABEL_21:
  if (*(_DWORD *)v38 != 2)
  {
    *(_DWORD *)v38 -= 2;
    goto LABEL_23;
  }
  WTF::StringImpl::destroy(v38, v7);
  v42 = (StringImpl *)*((void *)a3 + 9);
  *((void *)a3 + 9) = 0;
  v41 = (WTF::StringImpl *)v6->_internal.var0.__val_.language.m_impl.m_ptr;
  v6->_internal.var0.__val_.language.m_impl.m_ptr = v42;
  if (v41) {
    goto LABEL_26;
  }
LABEL_29:
  v6->_internal.var0.__val_.direction = *((unsigned char *)a3 + 80);
  v43 = (StringImpl *)*((void *)a3 + 11);
  *((void *)a3 + 11) = 0;
  v44 = (WTF::StringImpl *)v6->_internal.var0.__val_.originString.m_impl.m_ptr;
  v6->_internal.var0.__val_.originString.m_impl.m_ptr = v43;
  if (v44)
  {
    if (*(_DWORD *)v44 == 2) {
      WTF::StringImpl::destroy(v44, v7);
    }
    else {
      *(_DWORD *)v44 -= 2;
    }
  }
  WTF::URL::operator=((uint64_t)&v6->_internal.var0.__val_.serviceWorkerRegistrationURL, (uint64_t *)a3 + 12);
  *((_OWORD *)&v6->_internal.var0.__engaged_ + 9) = *((_OWORD *)a3 + 9);
  long long v46 = *((_OWORD *)a3 + 13);
  long long v48 = *((_OWORD *)a3 + 10);
  long long v47 = *((_OWORD *)a3 + 11);
  *(_OWORD *)&v6[1].super.isa = *((_OWORD *)a3 + 12);
  *(_OWORD *)&v6[1]._internal.var0.__null_state_ = v46;
  *(_OWORD *)&v6->_internal.creationTime.m_value = v48;
  *(_OWORD *)&v6->_internal.data.m_capacity = v47;
  v49 = (WTF *)*((void *)&v6[1]._internal.var0.__engaged_ + 2);
  if (v49)
  {
    *((void *)&v6[1]._internal.var0.__engaged_ + 2) = 0;
    v6[1]._internal.var0.__val_.defaultActionURL.m_hostEnd = 0;
    WTF::fastFree(v49, v45);
  }
  uint64_t v50 = *((void *)a3 + 28);
  *((void *)a3 + 28) = 0;
  *((void *)&v6[1]._internal.var0.__engaged_ + 2) = v50;
  LODWORD(v50) = *((_DWORD *)a3 + 58);
  *((_DWORD *)a3 + 58) = 0;
  v6[1]._internal.var0.__val_.defaultActionURL.m_hostEnd = v50;
  LODWORD(v50) = *((_DWORD *)a3 + 59);
  *((_DWORD *)a3 + 59) = 0;
  v6[1]._internal.var0.__val_.defaultActionURL.m_pathAfterLastSlash = v50;
  *((_WORD *)&v6[1]._internal.var0.__engaged_ + 16) = *((_WORD *)a3 + 120);
  return v4;
}

- (WebNotification)init
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WebNotification;
  [(WebNotification *)&v3 dealloc];
}

- (id)title
{
  uint64_t v2 = *((void *)self + 1);
  if (*(unsigned char *)(v2 + 272))
  {
    if (*(void *)(v2 + 56)) {
      return (id)WTF::StringImpl::operator NSString *();
    }
    else {
      return &stru_1F3C7DA90;
    }
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)body
{
  uint64_t v2 = *((void *)self + 1);
  if (*(unsigned char *)(v2 + 272))
  {
    if (*(void *)(v2 + 64)) {
      return (id)WTF::StringImpl::operator NSString *();
    }
    else {
      return &stru_1F3C7DA90;
    }
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)tag
{
  uint64_t v2 = *((void *)self + 1);
  if (*(unsigned char *)(v2 + 272))
  {
    if (*(void *)(v2 + 80)) {
      return (id)WTF::StringImpl::operator NSString *();
    }
    else {
      return &stru_1F3C7DA90;
    }
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)iconURL
{
  uint64_t v2 = *((void *)self + 1);
  if (*(unsigned char *)(v2 + 272))
  {
    if (*(void *)(v2 + 72)) {
      return (id)WTF::StringImpl::operator NSString *();
    }
    else {
      return &stru_1F3C7DA90;
    }
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)lang
{
  uint64_t v2 = *((void *)self + 1);
  if (*(unsigned char *)(v2 + 272))
  {
    if (*(void *)(v2 + 88)) {
      return (id)WTF::StringImpl::operator NSString *();
    }
    else {
      return &stru_1F3C7DA90;
    }
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)dir
{
  uint64_t v2 = *((void *)self + 1);
  if (*(unsigned char *)(v2 + 272))
  {
    int v3 = *(unsigned __int8 *)(v2 + 96);
    v4 = @"auto";
    if (v3 == 1) {
      v4 = @"ltr";
    }
    if (v3 == 2) {
      return @"rtl";
    }
    else {
      return v4;
    }
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)origin
{
  id result = [WebSecurityOrigin alloc];
  v4 = self->_private;
  if (*(&v4[1]._internal.var0.__engaged_ + 48))
  {
    id v5 = result;
    if (v4->_internal.var0.__val_.originString.m_impl.m_ptr) {
      v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      v6 = &stru_1F3C7DA90;
    }
    v7 = (void *)CFMakeCollectable((CFTypeRef)[v5 _initWithString:v6]);
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)notificationID
{
  uint64_t v2 = *((void *)self + 1);
  if (*(unsigned char *)(v2 + 272))
  {
    WTF::UUID::toString((uint64_t *)&v6, (WTF::UUID *)(v2 + 160));
    if (v6)
    {
      v4 = (void *)WTF::StringImpl::operator NSString *();
      id v5 = v6;
      v6 = 0;
      if (!v5) {
        return v4;
      }
      if (*(_DWORD *)v5 != 2)
      {
        *(_DWORD *)v5 -= 2;
        return v4;
      }
      WTF::StringImpl::destroy(v5, v3);
      return v4;
    }
    else
    {
      return &stru_1F3C7DA90;
    }
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (void)dispatchShowEvent
{
  if (a2) {
    MEMORY[0x1F416CF80](a2);
  }
}

- (void)dispatchCloseEvent
{
  if (a2) {
    MEMORY[0x1F416CF90](a2);
  }
}

- (void)dispatchClickEvent
{
  if (a2) {
    MEMORY[0x1F416CF88](a2);
  }
}

- (void)dispatchErrorEvent
{
  if (a2) {
    MEMORY[0x1F416CF98](a2);
  }
}

- (void)finalize
{
  if (a2) {
    MEMORY[0x1F416CFB0](a2);
  }
}

@end