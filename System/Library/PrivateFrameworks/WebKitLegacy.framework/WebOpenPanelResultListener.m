@interface WebOpenPanelResultListener
- (WebOpenPanelResultListener)initWithChooser:(void *)a3;
- (id).cxx_construct;
- (void)cancel;
- (void)chooseFilename:(id)a3;
- (void)chooseFilename:(id)a3 displayString:(id)a4 iconImage:(CGImage *)a5;
- (void)chooseFilenames:(id)a3;
- (void)chooseFilenames:(id)a3 displayString:(id)a4 iconImage:(CGImage *)a5;
@end

@implementation WebOpenPanelResultListener

- (WebOpenPanelResultListener)initWithChooser:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WebOpenPanelResultListener;
  v4 = [(WebOpenPanelResultListener *)&v10 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  ++*(_DWORD *)a3;
  m_ptr = (WebCore::FileChooser *)v4->_chooser.m_ptr;
  v5->_chooser.m_ptr = (FileChooser *)a3;
  if (!m_ptr) {
    return v5;
  }
  if (*(_DWORD *)m_ptr != 1)
  {
    --*(_DWORD *)m_ptr;
    return v5;
  }
  WebCore::FileChooser::~FileChooser(m_ptr);
  WTF::fastFree(v8, v9);
  return v5;
}

- (void)cancel
{
  m_ptr = self->_chooser.m_ptr;
  self->_chooser.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 1)
    {
      WebCore::FileChooser::~FileChooser((WebCore::FileChooser *)m_ptr);
      WTF::fastFree(v4, v5);
    }
    else
    {
      --*(_DWORD *)m_ptr;
    }
  }
}

- (void)chooseFilename:(id)a3
{
  m_ptr = self->_chooser.m_ptr;
  if (m_ptr)
  {
    MEMORY[0x1E4E442D0](&v10, a3);
    WebCore::FileChooser::chooseFile((WebCore::FileChooser *)m_ptr, (const WTF::String *)&v10);
    v6 = v10;
    objc_super v10 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v5);
        v7 = self->_chooser.m_ptr;
        self->_chooser.m_ptr = 0;
        if (!v7) {
          return;
        }
        goto LABEL_8;
      }
      *(_DWORD *)v6 -= 2;
    }
    v7 = self->_chooser.m_ptr;
    self->_chooser.m_ptr = 0;
    if (!v7) {
      return;
    }
LABEL_8:
    if (*(_DWORD *)v7 == 1)
    {
      WebCore::FileChooser::~FileChooser((WebCore::FileChooser *)v7);
      WTF::fastFree(v8, v9);
    }
    else
    {
      --*(_DWORD *)v7;
    }
  }
}

- (void)chooseFilenames:(id)a3
{
  if (self->_chooser.m_ptr)
  {
    WTF::makeVector<WTF::String>(a3, (uint64_t)&v12);
    WebCore::FileChooser::chooseFiles();
    if (v14)
    {
      v5 = v12;
      uint64_t v6 = 8 * v14;
      do
      {
        v7 = *(WTF::StringImpl **)v5;
        *(void *)v5 = 0;
        if (v7)
        {
          if (*(_DWORD *)v7 == 2) {
            WTF::StringImpl::destroy(v7, v4);
          }
          else {
            *(_DWORD *)v7 -= 2;
          }
        }
        v5 = (WTF *)((char *)v5 + 8);
        v6 -= 8;
      }
      while (v6);
    }
    v8 = v12;
    if (v12)
    {
      v12 = 0;
      int v13 = 0;
      WTF::fastFree(v8, v4);
    }
    m_ptr = self->_chooser.m_ptr;
    self->_chooser.m_ptr = 0;
    if (m_ptr)
    {
      if (*(_DWORD *)m_ptr == 1)
      {
        WebCore::FileChooser::~FileChooser((WebCore::FileChooser *)m_ptr);
        WTF::fastFree(v10, v11);
      }
      else
      {
        --*(_DWORD *)m_ptr;
      }
    }
  }
}

- (void)chooseFilename:(id)a3 displayString:(id)a4 iconImage:(CGImage *)a5
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = a3;
  -[WebOpenPanelResultListener chooseFilenames:displayString:iconImage:](self, "chooseFilenames:displayString:iconImage:", [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1], a4, a5);
}

- (void)chooseFilenames:(id)a3 displayString:(id)a4 iconImage:(CGImage *)a5
{
  if (!self->_chooser.m_ptr) {
    return;
  }
  WTF::makeVector<WTF::String>(a3, (uint64_t)&v23);
  MEMORY[0x1E4E442D0](&v22, a4);
  if (a5) {
    CFRetain(a5);
  }
  WebCore::Icon::create();
  WebCore::FileChooser::chooseMediaFiles();
  if (!v21)
  {
LABEL_7:
    v9 = a5;
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (*(_DWORD *)v21 != 1)
  {
    --*(_DWORD *)v21;
    goto LABEL_7;
  }
  WebCore::Icon::~Icon(v21);
  WTF::fastFree(v12, v13);
  v9 = a5;
  if (a5) {
LABEL_8:
  }
    CFRelease(v9);
LABEL_9:
  objc_super v10 = v22;
  v22 = 0;
  if (!v10) {
    goto LABEL_12;
  }
  if (*(_DWORD *)v10 != 2)
  {
    *(_DWORD *)v10 -= 2;
LABEL_12:
    uint64_t v11 = v25;
    if (!v25) {
      goto LABEL_23;
    }
LABEL_17:
    unsigned int v14 = v23;
    uint64_t v15 = 8 * v11;
    do
    {
      v16 = *(WTF::StringImpl **)v14;
      *(void *)unsigned int v14 = 0;
      if (v16)
      {
        if (*(_DWORD *)v16 == 2) {
          WTF::StringImpl::destroy(v16, v8);
        }
        else {
          *(_DWORD *)v16 -= 2;
        }
      }
      unsigned int v14 = (WTF *)((char *)v14 + 8);
      v15 -= 8;
    }
    while (v15);
    goto LABEL_23;
  }
  WTF::StringImpl::destroy(v10, v8);
  uint64_t v11 = v25;
  if (v25) {
    goto LABEL_17;
  }
LABEL_23:
  v17 = v23;
  if (v23)
  {
    v23 = 0;
    int v24 = 0;
    WTF::fastFree(v17, v8);
  }
  m_ptr = self->_chooser.m_ptr;
  self->_chooser.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 1)
    {
      WebCore::FileChooser::~FileChooser((WebCore::FileChooser *)m_ptr);
      WTF::fastFree(v19, v20);
    }
    else
    {
      --*(_DWORD *)m_ptr;
    }
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_chooser.m_ptr;
  self->_chooser.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 1)
    {
      WebCore::FileChooser::~FileChooser((WebCore::FileChooser *)m_ptr);
      WTF::fastFree(v4, v5);
    }
    else
    {
      --*(_DWORD *)m_ptr;
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end