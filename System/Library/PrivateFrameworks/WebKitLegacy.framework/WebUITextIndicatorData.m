@interface WebUITextIndicatorData
- (CGRect)contentImageWithoutSelectionRectInRootViewCoordinates;
- (CGRect)selectionRectInRootViewCoordinates;
- (CGRect)textBoundingRectInRootViewCoordinates;
- (NSArray)textRectsInBoundingRectCoordinates;
- (UIColor)estimatedBackgroundColor;
- (UIImage)contentImage;
- (UIImage)contentImageWithHighlight;
- (UIImage)contentImageWithoutSelection;
- (UIImage)dataInteractionImage;
- (WebUITextIndicatorData)initWithImage:(CGImage *)a3 scale:(double)a4;
- (WebUITextIndicatorData)initWithImage:(CGImage *)a3 textIndicatorData:(const void *)a4 scale:(double)a5;
- (double)contentImageScaleFactor;
- (void)dealloc;
- (void)setContentImage:(id)a3;
- (void)setContentImageScaleFactor:(double)a3;
- (void)setContentImageWithHighlight:(id)a3;
- (void)setContentImageWithoutSelection:(id)a3;
- (void)setContentImageWithoutSelectionRectInRootViewCoordinates:(CGRect)a3;
- (void)setDataInteractionImage:(id)a3;
- (void)setEstimatedBackgroundColor:(id)a3;
- (void)setSelectionRectInRootViewCoordinates:(CGRect)a3;
- (void)setTextBoundingRectInRootViewCoordinates:(CGRect)a3;
- (void)setTextRectsInBoundingRectCoordinates:(id)a3;
@end

@implementation WebUITextIndicatorData

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WebUITextIndicatorData;
  [(WebUITextIndicatorData *)&v3 dealloc];
}

- (UIImage)dataInteractionImage
{
  return self->_dataInteractionImage;
}

- (void)setDataInteractionImage:(id)a3
{
}

- (CGRect)selectionRectInRootViewCoordinates
{
  double x = self->_selectionRectInRootViewCoordinates.origin.x;
  double y = self->_selectionRectInRootViewCoordinates.origin.y;
  double width = self->_selectionRectInRootViewCoordinates.size.width;
  double height = self->_selectionRectInRootViewCoordinates.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSelectionRectInRootViewCoordinates:(CGRect)a3
{
  self->_selectionRectInRootViewCoordinates = a3;
}

- (CGRect)textBoundingRectInRootViewCoordinates
{
  double x = self->_textBoundingRectInRootViewCoordinates.origin.x;
  double y = self->_textBoundingRectInRootViewCoordinates.origin.y;
  double width = self->_textBoundingRectInRootViewCoordinates.size.width;
  double height = self->_textBoundingRectInRootViewCoordinates.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTextBoundingRectInRootViewCoordinates:(CGRect)a3
{
  self->_textBoundingRectInRootViewCoordinates = a3;
}

- (NSArray)textRectsInBoundingRectCoordinates
{
  return self->_textRectsInBoundingRectCoordinates;
}

- (void)setTextRectsInBoundingRectCoordinates:(id)a3
{
}

- (UIImage)contentImageWithHighlight
{
  return self->_contentImageWithHighlight;
}

- (void)setContentImageWithHighlight:(id)a3
{
}

- (UIImage)contentImageWithoutSelection
{
  return self->_contentImageWithoutSelection;
}

- (void)setContentImageWithoutSelection:(id)a3
{
}

- (CGRect)contentImageWithoutSelectionRectInRootViewCoordinates
{
  double x = self->_contentImageWithoutSelectionRectInRootViewCoordinates.origin.x;
  double y = self->_contentImageWithoutSelectionRectInRootViewCoordinates.origin.y;
  double width = self->_contentImageWithoutSelectionRectInRootViewCoordinates.size.width;
  double height = self->_contentImageWithoutSelectionRectInRootViewCoordinates.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentImageWithoutSelectionRectInRootViewCoordinates:(CGRect)a3
{
  self->_contentImageWithoutSelectionRectInRootViewCoordinates = a3;
}

- (UIImage)contentImage
{
  return self->_contentImage;
}

- (void)setContentImage:(id)a3
{
}

- (UIColor)estimatedBackgroundColor
{
  return self->_estimatedBackgroundColor;
}

- (void)setEstimatedBackgroundColor:(id)a3
{
}

- (double)contentImageScaleFactor
{
  return self->_contentImageScaleFactor;
}

- (void)setContentImageScaleFactor:(double)a3
{
  self->_contentImageScaleFactor = a3;
}

- (WebUITextIndicatorData)initWithImage:(CGImage *)a3 textIndicatorData:(const void *)a4 scale:(double)a5
{
  v73.receiver = self;
  v73.super_class = (Class)WebUITextIndicatorData;
  v8 = [(WebUITextIndicatorData *)&v73 init];
  if (!v8) {
    return v8;
  }
  v9 = (uint64_t (**)(void))MEMORY[0x1E4FB6268];
  v8->_dataInteractionImage = (UIImage *)[objc_alloc((Class)((uint64_t (*)(void))*MEMORY[0x1E4FB6268])()) initWithCGImage:a3 scale:5 orientation:a5];
  WebCore::FloatRect::operator CGRect();
  v8->_selectionRectInRootViewCoordinates.origin.double x = v10;
  v8->_selectionRectInRootViewCoordinates.origin.double y = v11;
  v8->_selectionRectInRootViewCoordinates.size.double width = v12;
  v8->_selectionRectInRootViewCoordinates.size.double height = v13;
  WebCore::FloatRect::operator CGRect();
  v8->_textBoundingRectInRootViewCoordinates.origin.double x = v14;
  v8->_textBoundingRectInRootViewCoordinates.origin.double y = v15;
  v8->_textBoundingRectInRootViewCoordinates.size.double width = v16;
  v8->_textBoundingRectInRootViewCoordinates.size.double height = v17;
  NSArrayElement = (WebCore::DestinationColorSpace *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((unsigned int *)a4 + 15)];
  v20 = NSArrayElement;
  uint64_t v21 = *((unsigned int *)a4 + 15);
  if (v21)
  {
    v22 = (WebCore *)*((void *)a4 + 6);
    uint64_t v23 = 16 * v21;
    do
    {
      NSArrayElement = (WebCore::DestinationColorSpace *)WebCore::makeNSArrayElement(v22, v19);
      if (NSArrayElement) {
        NSArrayElement = (WebCore::DestinationColorSpace *)[(WebCore::DestinationColorSpace *)v20 addObject:NSArrayElement];
      }
      v22 = (WebCore *)((char *)v22 + 16);
      v23 -= 16;
    }
    while (v23);
  }
  v8->_textRectsInBoundingRectCoordinates = (NSArray *)v20;
  v8->_contentImageScaleFactor = *((float *)a4 + 16);
  if (*((void *)a4 + 9))
  {
    v24 = (WebCore::DestinationColorSpace *)objc_alloc((Class)(*v9)());
    uint64_t v25 = *((void *)a4 + 9);
    uint64_t v26 = WebCore::DestinationColorSpace::SRGB(v24);
    (*(void (**)(WebCore::NativeImage **__return_ptr, uint64_t, uint64_t))(*(void *)v25 + 288))(&v72, v25, v26);
    NSArrayElement = [(WebCore::DestinationColorSpace *)v24 initWithCGImage:*(void *)WebCore::NativeImage::platformImage(v72) scale:5 orientation:a5];
    v8->_contentImageWithHighlight = (UIImage *)NSArrayElement;
    v28 = v72;
    v72 = 0;
    if (v28)
    {
      char v29 = 0;
      uint64_t v30 = *((void *)v28 + 1);
      atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v30, (unsigned __int8 *)&v29, 1u, memory_order_acquire, memory_order_acquire);
      if (v29)
      {
        NSArrayElement = (WebCore::DestinationColorSpace *)MEMORY[0x1E4E44220](v30);
        uint64_t v66 = *(void *)(v30 + 8);
        int v32 = 1;
        uint64_t v33 = v66 - 1;
        *(void *)(v30 + 8) = v66 - 1;
        if (v66 != 1)
        {
LABEL_11:
          uint64_t v34 = 0;
          BOOL v35 = 1;
          atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v30, (unsigned __int8 *)&v32, 0, memory_order_release, memory_order_relaxed);
          if (v32 == 1) {
            goto LABEL_12;
          }
          goto LABEL_43;
        }
      }
      else
      {
        uint64_t v31 = *(void *)(v30 + 8);
        int v32 = 1;
        uint64_t v33 = v31 - 1;
        *(void *)(v30 + 8) = v31 - 1;
        if (v31 != 1) {
          goto LABEL_11;
        }
      }
      uint64_t v67 = *(void *)(v30 + 16);
      uint64_t v34 = *(void *)(v30 + 24);
      *(void *)(v30 + 24) = 0;
      BOOL v35 = v67 != 0;
      atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v30, (unsigned __int8 *)&v32, 0, memory_order_release, memory_order_relaxed);
      if (v32 == 1)
      {
LABEL_12:
        if (v33) {
          goto LABEL_17;
        }
        goto LABEL_13;
      }
LABEL_43:
      NSArrayElement = (WebCore::DestinationColorSpace *)WTF::Lock::unlockSlow((WTF::Lock *)v30);
      if (v33) {
        goto LABEL_17;
      }
LABEL_13:
      if (v34) {
        NSArrayElement = (WebCore::DestinationColorSpace *)(*(uint64_t (**)(uint64_t))(*(void *)v34 + 8))(v34);
      }
      if (!v35) {
        NSArrayElement = (WebCore::DestinationColorSpace *)WTF::fastFree((WTF *)v30, v27);
      }
    }
  }
LABEL_17:
  if (!*((void *)a4 + 11)) {
    goto LABEL_27;
  }
  v36 = (WebCore::DestinationColorSpace *)objc_alloc((Class)(*v9)());
  uint64_t v37 = *((void *)a4 + 11);
  uint64_t v38 = WebCore::DestinationColorSpace::SRGB(v36);
  (*(void (**)(WebCore::NativeImage **__return_ptr, uint64_t, uint64_t))(*(void *)v37 + 288))(&v72, v37, v38);
  NSArrayElement = [(WebCore::DestinationColorSpace *)v36 initWithCGImage:*(void *)WebCore::NativeImage::platformImage(v72) scale:0 orientation:a5];
  v8->_contentImage = (UIImage *)NSArrayElement;
  v40 = v72;
  v72 = 0;
  if (!v40) {
    goto LABEL_27;
  }
  char v41 = 0;
  uint64_t v42 = *((void *)v40 + 1);
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v42, (unsigned __int8 *)&v41, 1u, memory_order_acquire, memory_order_acquire);
  if (v41)
  {
    NSArrayElement = (WebCore::DestinationColorSpace *)MEMORY[0x1E4E44220](v42);
    uint64_t v68 = *(void *)(v42 + 8);
    int v44 = 1;
    uint64_t v45 = v68 - 1;
    *(void *)(v42 + 8) = v68 - 1;
    if (v68 != 1)
    {
LABEL_21:
      uint64_t v46 = 0;
      BOOL v47 = 1;
      atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v42, (unsigned __int8 *)&v44, 0, memory_order_release, memory_order_relaxed);
      if (v44 == 1) {
        goto LABEL_22;
      }
      goto LABEL_47;
    }
  }
  else
  {
    uint64_t v43 = *(void *)(v42 + 8);
    int v44 = 1;
    uint64_t v45 = v43 - 1;
    *(void *)(v42 + 8) = v43 - 1;
    if (v43 != 1) {
      goto LABEL_21;
    }
  }
  uint64_t v69 = *(void *)(v42 + 16);
  uint64_t v46 = *(void *)(v42 + 24);
  *(void *)(v42 + 24) = 0;
  BOOL v47 = v69 != 0;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v42, (unsigned __int8 *)&v44, 0, memory_order_release, memory_order_relaxed);
  if (v44 == 1)
  {
LABEL_22:
    if (v45) {
      goto LABEL_27;
    }
    goto LABEL_23;
  }
LABEL_47:
  NSArrayElement = (WebCore::DestinationColorSpace *)WTF::Lock::unlockSlow((WTF::Lock *)v42);
  if (v45) {
    goto LABEL_27;
  }
LABEL_23:
  if (v46) {
    NSArrayElement = (WebCore::DestinationColorSpace *)(*(uint64_t (**)(uint64_t))(*(void *)v46 + 8))(v46);
  }
  if (!v47) {
    NSArrayElement = (WebCore::DestinationColorSpace *)WTF::fastFree((WTF *)v42, v39);
  }
LABEL_27:
  uint64_t v48 = *((void *)a4 + 10);
  if (!v48) {
    goto LABEL_38;
  }
  uint64_t v49 = WebCore::DestinationColorSpace::SRGB(NSArrayElement);
  v50 = (*(void *(**)(WebCore::NativeImage **__return_ptr, uint64_t, uint64_t))(*(void *)v48 + 288))(&v72, v48, v49);
  if (!v72) {
    goto LABEL_38;
  }
  id v51 = objc_alloc((Class)((uint64_t (*)(void *))*v9)(v50));
  v8->_contentImageWithoutSelection = (UIImage *)[v51 initWithCGImage:*(void *)WebCore::NativeImage::platformImage(v72) scale:0 orientation:a5];
  WebCore::FloatRect::operator CGRect();
  v8->_contentImageWithoutSelectionRectInRootViewCoordinates.origin.double x = v53;
  v8->_contentImageWithoutSelectionRectInRootViewCoordinates.origin.double y = v54;
  v8->_contentImageWithoutSelectionRectInRootViewCoordinates.size.double width = v55;
  v8->_contentImageWithoutSelectionRectInRootViewCoordinates.size.double height = v56;
  v57 = v72;
  v72 = 0;
  if (!v57) {
    goto LABEL_38;
  }
  char v58 = 0;
  uint64_t v59 = *((void *)v57 + 1);
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v59, (unsigned __int8 *)&v58, 1u, memory_order_acquire, memory_order_acquire);
  if (v58)
  {
    MEMORY[0x1E4E44220](v59);
    uint64_t v70 = *(void *)(v59 + 8);
    int v61 = 1;
    uint64_t v62 = v70 - 1;
    *(void *)(v59 + 8) = v70 - 1;
    if (v70 != 1)
    {
LABEL_32:
      uint64_t v63 = 0;
      BOOL v64 = 1;
      atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v59, (unsigned __int8 *)&v61, 0, memory_order_release, memory_order_relaxed);
      if (v61 == 1) {
        goto LABEL_33;
      }
LABEL_51:
      WTF::Lock::unlockSlow((WTF::Lock *)v59);
      if (!v62) {
        goto LABEL_34;
      }
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v60 = *(void *)(v59 + 8);
    int v61 = 1;
    uint64_t v62 = v60 - 1;
    *(void *)(v59 + 8) = v60 - 1;
    if (v60 != 1) {
      goto LABEL_32;
    }
  }
  uint64_t v71 = *(void *)(v59 + 16);
  uint64_t v63 = *(void *)(v59 + 24);
  *(void *)(v59 + 24) = 0;
  BOOL v64 = v71 != 0;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v59, (unsigned __int8 *)&v61, 0, memory_order_release, memory_order_relaxed);
  if (v61 != 1) {
    goto LABEL_51;
  }
LABEL_33:
  if (!v62)
  {
LABEL_34:
    if (v63) {
      (*(void (**)(uint64_t))(*(void *)v63 + 8))(v63);
    }
    if (!v64) {
      WTF::fastFree((WTF *)v59, v52);
    }
  }
LABEL_38:
  if ((*((_WORD *)a4 + 53) & 0x800) != 0)
  {
    WebCore::cocoaColor();
    v8->_estimatedBackgroundColor = (UIColor *)v72;
  }
  return v8;
}

- (WebUITextIndicatorData)initWithImage:(CGImage *)a3 scale:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WebUITextIndicatorData;
  v6 = [(WebUITextIndicatorData *)&v8 init];
  if (v6) {
    v6->_dataInteractionImage = (UIImage *)[objc_alloc((Class)((uint64_t (*)(void))*MEMORY[0x1E4FB6268])()) initWithCGImage:a3 scale:5 orientation:a4];
  }
  return v6;
}

@end