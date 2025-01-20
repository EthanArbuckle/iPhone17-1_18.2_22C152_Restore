@interface SLDCollaborationAttributionViewRenderer
+ (id)accessibilityLabelForTag:(id)a3;
+ (id)collaboratorsStringForTag:(id)a3 prefixingWith:(BOOL)a4;
- (BOOL)isRTL;
- (BOOL)shouldShowGenericIconIfApplicableForVariant:(int64_t)a3;
- (BOOL)shouldShowLabels;
- (BOOL)shouldShowMonogramIfApplicableForVariant:(int64_t)a3;
- (BOOL)shouldShowSnowglobeIfApplicableForVariant:(int64_t)a3;
- (BOOL)shouldShowSubtitle;
- (CGImage)newAvatarImage;
- (CGImage)newAvatarImageForConversationDrawingMetadata:(id)a3 allowSnowglobe:(BOOL)a4 allowMonogram:(BOOL)a5;
- (CGImage)newAvatarImageForRecipientDrawingMetadata:(id)a3 allowMonogram:(BOOL)a4;
- (CGImage)newGroupPhotoImageFromFileURL:(id)a3;
- (CGImage)newImageFromData:(id)a3;
- (CGImage)newMonogramImageForContact:(id)a3;
- (CGImage)newSnowglobeImageWithCGImages:(id)a3;
- (CGRect)drawAvatarWithImageRef:(CGImage *)a3 inContext:(CGContext *)a4;
- (CGRect)drawGenericGlyphInContext:(CGContext *)a3;
- (SLCollaborationAttributionViewMetricsProvider)metricsProvider;
- (SLDCollaborationAttributionViewRenderer)initWithStyle:(id)a3 tag:(id)a4;
- (SLDCollaborationAttributionViewSlotTag)slotTag;
- (UISSlotStyle)slotStyle;
- (double)heightForLine:(__CTLine *)a3 withOptions:(unint64_t)a4;
- (id)collaboratorsString;
- (id)withCollaboratorsString;
- (void)drawLine:(__CTLine *)a3 inRect:(CGRect)a4 inContext:(CGContext *)a5;
- (void)renderInContext:(CGContext *)a3;
- (void)setMetricsProvider:(id)a3;
- (void)setRTL:(BOOL)a3;
- (void)setSlotStyle:(id)a3;
- (void)setSlotTag:(id)a3;
@end

@implementation SLDCollaborationAttributionViewRenderer

- (SLDCollaborationAttributionViewRenderer)initWithStyle:(id)a3 tag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLDCollaborationAttributionViewRenderer;
  v9 = [(SLDCollaborationAttributionViewRenderer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_slotStyle, a3);
    objc_storeStrong((id *)&v10->_slotTag, a4);
    v10->_RTL = [v7 layoutDirection] == 1;
    v11 = [[SLCollaborationAttributionViewMetricsProvider alloc] initWithSlotStyle:v7 tag:v8];
    metricsProvider = v10->_metricsProvider;
    v10->_metricsProvider = v11;
  }
  return v10;
}

- (void)renderInContext:(CGContext *)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v5 = SLDaemonLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v70 = 138412290;
    v71 = self;
    _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_DEFAULT, "[%@] SLDCollaborationAttributionViewRenderer about to render.", (uint8_t *)&v70, 0xCu);
  }

  CGFloat v6 = *MEMORY[0x1E4F1DB28];
  CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10 = [(SLDCollaborationAttributionViewRenderer *)self newAvatarImage];
  if (v10)
  {
    v11 = v10;
    [(SLDCollaborationAttributionViewRenderer *)self drawAvatarWithImageRef:v10 inContext:a3];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    double v19 = v18;
    CFRelease(v11);
  }
  else
  {
    v20 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
    BOOL v21 = -[SLDCollaborationAttributionViewRenderer shouldShowGenericIconIfApplicableForVariant:](self, "shouldShowGenericIconIfApplicableForVariant:", [v20 variant]);

    v22 = SLDaemonLogHandle();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
    if (v21)
    {
      if (v23)
      {
        int v70 = 138412290;
        v71 = self;
        _os_log_impl(&dword_19BE17000, v22, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer Showing generic glyph because avatar image was nil.", (uint8_t *)&v70, 0xCu);
      }

      [(SLDCollaborationAttributionViewRenderer *)self drawGenericGlyphInContext:a3];
      CGFloat v13 = v24;
      CGFloat v15 = v25;
      CGFloat v17 = v26;
      double v19 = v27;
    }
    else
    {
      if (v23)
      {
        int v70 = 138412290;
        v71 = self;
        _os_log_impl(&dword_19BE17000, v22, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer Not drawing an avatar because avatar image was nil and generic icon was not supported for the current variant.", (uint8_t *)&v70, 0xCu);
      }

      double v19 = v9;
      CGFloat v17 = v8;
      CGFloat v15 = v7;
      CGFloat v13 = v6;
    }
  }
  if ([(SLDCollaborationAttributionViewRenderer *)self shouldShowLabels])
  {
    v28 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
    if ([v28 variant] == 2)
    {
    }
    else
    {
      v29 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
      uint64_t v30 = [v29 variant];

      if (v30 != 5)
      {
        v34 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
        v31 = [v34 title];

        if (v31) {
          goto LABEL_17;
        }
        goto LABEL_19;
      }
    }
    v31 = [(SLDCollaborationAttributionViewRenderer *)self collaboratorsString];
    if (v31)
    {
LABEL_17:
      v32 = [(SLDCollaborationAttributionViewRenderer *)self metricsProvider];
      uint64_t v33 = [v32 singleLineTitleForString:v31];

      goto LABEL_20;
    }
LABEL_19:
    uint64_t v33 = 0;
LABEL_20:
    if ([(SLDCollaborationAttributionViewRenderer *)self shouldShowSubtitle])
    {
      v35 = [(SLDCollaborationAttributionViewRenderer *)self withCollaboratorsString];
      if (v35)
      {
        v36 = [(SLDCollaborationAttributionViewRenderer *)self metricsProvider];
        uint64_t v37 = [v36 singleLineSubtitleForString:v35];
      }
      else
      {
        uint64_t v37 = 0;
      }
    }
    else
    {
      uint64_t v37 = 0;
    }
    v77.origin.x = v13;
    v77.origin.y = v15;
    v77.size.width = v17;
    v77.size.height = v19;
    v79.origin.x = v6;
    v79.origin.y = v7;
    v79.size.width = v8;
    v79.size.height = v9;
    double v38 = 0.0;
    if (!CGRectEqualToRect(v77, v79))
    {
      v39 = [(SLDCollaborationAttributionViewRenderer *)self metricsProvider];
      [v39 avatarLabelSpace];
      double v38 = v40;
    }
    v78.origin.x = v13;
    v78.origin.y = v15;
    v78.size.width = v17;
    v78.size.height = v19;
    double MaxX = CGRectGetMaxX(v78);
    [(SLDCollaborationAttributionViewRenderer *)self heightForLine:v33 withOptions:8];
    double v43 = v42;
    [(SLDCollaborationAttributionViewRenderer *)self heightForLine:v37 withOptions:8];
    double v45 = v44;
    double v46 = v43 + v44;
    if (v44 > 0.0)
    {
      v47 = [(SLDCollaborationAttributionViewRenderer *)self metricsProvider];
      [v47 titleSubtitleSpace];
      double v46 = v46 + v48;
    }
    double v49 = v38 + MaxX;
    if (v46 >= v19) {
      double v50 = 0.0;
    }
    else {
      double v50 = (v19 - v46) * 0.5;
    }
    if (v33)
    {
      v51 = [(SLDCollaborationAttributionViewRenderer *)self metricsProvider];
      [v51 drawingSize];
      double v53 = v52 - v49;

      -[SLDCollaborationAttributionViewRenderer drawLine:inRect:inContext:](self, "drawLine:inRect:inContext:", v33, a3, v49, v50, v53, v43);
      if (v37)
      {
LABEL_35:
        v54 = [(SLDCollaborationAttributionViewRenderer *)self metricsProvider];
        [v54 titleSubtitleSpace];
        double v56 = v43 + v50 + v55;
        v57 = [(SLDCollaborationAttributionViewRenderer *)self metricsProvider];
        [v57 drawingSize];
        double v59 = v58 - v49;

        -[SLDCollaborationAttributionViewRenderer drawLine:inRect:inContext:](self, "drawLine:inRect:inContext:", v37, a3, v49, v56, v59, v45);
LABEL_42:

        return;
      }
    }
    else
    {
      v60 = SLDaemonLogHandle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        v61 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
        v62 = [v61 conversationDrawingMetadata];
        v63 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
        v64 = [v63 collaboratorDisplayNames];
        int v70 = 138412802;
        v71 = self;
        __int16 v72 = 2112;
        v73 = v62;
        __int16 v74 = 2112;
        v75 = v64;
        _os_log_impl(&dword_19BE17000, v60, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer failed to draw a title. conversationMetadata:%@ collaborationDisplayNames:%@.", (uint8_t *)&v70, 0x20u);
      }
      if (v37) {
        goto LABEL_35;
      }
    }
    v65 = SLDaemonLogHandle();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      v66 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
      v67 = [v66 conversationDrawingMetadata];
      v68 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
      v69 = [v68 collaboratorDisplayNames];
      int v70 = 138412802;
      v71 = self;
      __int16 v72 = 2112;
      v73 = v67;
      __int16 v74 = 2112;
      v75 = v69;
      _os_log_impl(&dword_19BE17000, v65, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer failed to draw a subtitle. conversationMetadata:%@ collaborationDisplayNames:%@.", (uint8_t *)&v70, 0x20u);
    }
    goto LABEL_42;
  }
}

- (CGImage)newGroupPhotoImageFromFileURL:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v10 = 0;
    v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:1 error:&v10];
    id v6 = v10;
    if (v5)
    {
      CGFloat v7 = SLDCreateGroupPhotoImageWithData(v5);
    }
    else
    {
      CGFloat v8 = SLDaemonLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        double v12 = self;
        __int16 v13 = 2112;
        id v14 = v4;
        __int16 v15 = 2112;
        id v16 = v6;
        _os_log_error_impl(&dword_19BE17000, v8, OS_LOG_TYPE_ERROR, "[%@] SLDCollaborationAttributionViewRenderer failed to retrieve group photo data from file URL %@. error: %@", buf, 0x20u);
      }

      CGFloat v7 = 0;
    }
  }
  else
  {
    CGFloat v7 = 0;
  }

  return v7;
}

- (CGImage)newSnowglobeImageWithCGImages:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F5A6E8] maxContacts];
  id v6 = v4;
  if ([v4 count] > v5)
  {
    id v6 = objc_msgSend(v4, "subarrayWithRange:", 0, objc_msgSend(MEMORY[0x1E4F5A6E8], "maxContacts"));
  }
  uint64_t v7 = [v6 count];
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)v25 - v9;
  if (v8 >= 0x200) {
    size_t v11 = 512;
  }
  else {
    size_t v11 = v8;
  }
  bzero((char *)v25 - v9, v11);
  if ([v6 count])
  {
    unint64_t v12 = 0;
    do
    {
      __int16 v13 = [v6 objectAtIndexedSubscript:v12];
      *(void *)&v10[8 * v12] = v13;

      ++v12;
    }
    while ([v6 count] > v12);
  }
  id v14 = [(SLDCollaborationAttributionViewRenderer *)self metricsProvider];
  [v14 avatarDiameter];
  double v16 = v15;

  uint64_t v17 = (void *)MEMORY[0x1E4F5A6C8];
  double v18 = [(SLDCollaborationAttributionViewRenderer *)self slotStyle];
  double v19 = objc_msgSend(v17, "renderingScopeWithPointSize:scale:rightToLeft:style:color:", -[SLDCollaborationAttributionViewRenderer isRTL](self, "isRTL"), 0, 0, v16, v16, (double)objc_msgSend(v18, "displayScale"));

  v20 = (void *)MEMORY[0x1E4F5A6F8];
  uint64_t v21 = [v6 count];
  v22 = (const void *)objc_msgSend(v20, "imageForAvatarImages:badgeImages:badgeTypes:rect:itemCount:scope:", v10, 0, MEMORY[0x1E4F1CBF0], v21, v19, 0.0, 0.0, v16, v16);
  CFRetain(v22);
  if (!v22)
  {
    BOOL v23 = SLDaemonLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      [(SLDCollaborationAttributionViewRenderer *)(uint64_t)self newSnowglobeImageWithCGImages:v23];
    }
  }
  return (CGImage *)v22;
}

- (CGImage)newImageFromData:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  id v4 = (const UInt8 *)[v3 bytes];
  CFIndex v5 = [v3 length];

  CFDataRef v6 = CFDataCreate(0, v4, v5);
  uint64_t v7 = CGDataProviderCreateWithCFData(v6);
  CGImageRef ImageAtIndex = v7;
  if (v7)
  {
    uint64_t v9 = CGImageSourceCreateWithDataProvider(v7, 0);
    CFRelease(ImageAtIndex);
    if (v9)
    {
      CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v9, 0, 0);
      CFRelease(v9);
    }
    else
    {
      CGImageRef ImageAtIndex = 0;
    }
  }
  CFRelease(v6);
  return ImageAtIndex;
}

- (CGImage)newMonogramImageForContact:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_6:
    Image = 0;
    goto LABEL_7;
  }
  CFIndex v5 = [(SLDCollaborationAttributionViewRenderer *)self slotStyle];
  double v6 = (double)[v5 displayScale];

  uint64_t v7 = [(SLDCollaborationAttributionViewRenderer *)self metricsProvider];
  [v7 avatarDiameter];
  double v9 = v8;

  double v10 = v9 * v6;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  size_t v12 = vcvtpd_s64_f64(v10);
  size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  id v14 = CGBitmapContextCreate(0, v12, v12, 8uLL, AlignedBytesPerRow, DeviceRGB, 1u);
  double v15 = [(SLDCollaborationAttributionViewRenderer *)self slotStyle];
  SLDRenderContactMonogramInContextAtRect(v15, v4, v14, 0, v10, 0.0, 0.0, v10, v10);

  Image = CGBitmapContextCreateImage(v14);
  CGContextRelease(v14);
  CGColorSpaceRelease(DeviceRGB);
  if (!Image)
  {
    uint64_t v17 = SLDaemonLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationAttributionViewRenderer newMonogramImageForContact:]();
    }

    goto LABEL_6;
  }
LABEL_7:

  return Image;
}

- (CGImage)newAvatarImageForConversationDrawingMetadata:(id)a3 allowSnowglobe:(BOOL)a4 allowMonogram:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (![v8 isGroupConversation])
  {
    uint64_t v17 = [v8 recipientDrawingMetadata];
    double v15 = [v17 firstObject];

    if (v15)
    {
      double v16 = [(SLDCollaborationAttributionViewRenderer *)self newAvatarImageForRecipientDrawingMetadata:v15 allowMonogram:v5];
LABEL_21:
      __int16 v13 = v16;
LABEL_28:

      goto LABEL_29;
    }
    double v25 = SLDaemonLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v33 = self;
      __int16 v34 = 2112;
      id v35 = v8;
      _os_log_impl(&dword_19BE17000, v25, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer Returning nil for avatar image because recipient drawing metadata was nil. %@.", buf, 0x16u);
    }

LABEL_27:
    __int16 v13 = 0;
    goto LABEL_28;
  }
  uint64_t v9 = [v8 groupID];
  if (!v9
    || (double v10 = (void *)v9,
        [v8 groupPhotoFileURL],
        size_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
    if (v6)
    {
      double v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      double v18 = objc_msgSend(v8, "recipientDrawingMetadata", 0);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v28;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v28 != v21) {
              objc_enumerationMutation(v18);
            }
            BOOL v23 = [(SLDCollaborationAttributionViewRenderer *)self newAvatarImageForRecipientDrawingMetadata:*(void *)(*((void *)&v27 + 1) + 8 * v22) allowMonogram:1];
            if (v23)
            {
              double v24 = v23;
              [v15 addObject:v23];
              CFRelease(v24);
            }
            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v20);
      }

      double v16 = [(SLDCollaborationAttributionViewRenderer *)self newSnowglobeImageWithCGImages:v15];
      goto LABEL_21;
    }
    double v15 = SLDaemonLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v33 = self;
      __int16 v34 = 2112;
      id v35 = v8;
      _os_log_impl(&dword_19BE17000, v15, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer Returning nil for avatar image because there was no group photo and snowglobes aren't allowed. %@.", buf, 0x16u);
    }
    goto LABEL_27;
  }
  size_t v12 = [v8 groupID];
  __int16 v13 = SLDCreateGroupPhotoImageWithGroupID(v12);

  if (!v13)
  {
    id v14 = SLDaemonLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v33 = self;
      __int16 v34 = 2112;
      id v35 = v8;
      _os_log_impl(&dword_19BE17000, v14, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer Failed to get avatar image from IMSPI. Trying with groupPhotoFileURL. %@.", buf, 0x16u);
    }

    double v15 = [v8 groupPhotoFileURL];
    double v16 = [(SLDCollaborationAttributionViewRenderer *)self newGroupPhotoImageFromFileURL:v15];
    goto LABEL_21;
  }
LABEL_29:

  return v13;
}

- (CGImage)newAvatarImageForRecipientDrawingMetadata:(id)a3 allowMonogram:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 contact];
  if (!v7)
  {
    id v8 = SLDaemonLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      id v14 = self;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_19BE17000, v8, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer Returning nil for avatar image because recipient contact was nil. %@.", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_15;
  }
  id v8 = [v6 contactImageData];
  if (!v8)
  {
    if (v4)
    {
LABEL_11:
      uint64_t v9 = [(SLDCollaborationAttributionViewRenderer *)self newMonogramImageForContact:v7];
      goto LABEL_16;
    }
    size_t v11 = SLDaemonLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      id v14 = self;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_19BE17000, v11, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer Returning nil for avatar image because there was no contact photo and monograms aren't allowed. %@.", (uint8_t *)&v13, 0x16u);
    }

LABEL_15:
    uint64_t v9 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = [(SLDCollaborationAttributionViewRenderer *)self newImageFromData:v8];
  if (!v9 && v4)
  {
    double v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationAttributionViewRenderer newAvatarImageForRecipientDrawingMetadata:allowMonogram:]();
    }

    goto LABEL_11;
  }
LABEL_16:

  return v9;
}

- (CGImage)newAvatarImage
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
  char v4 = [v3 isPlaceholder];

  if (v4)
  {
    BOOL v5 = SLDaemonLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v28 = self;
      _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer Returning nil for avatar image because slot tag isPlaceholder was YES.", buf, 0xCu);
    }
    goto LABEL_24;
  }
  id v6 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
  BOOL v5 = [v6 conversationDrawingMetadata];

  uint64_t v7 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
  BOOL v8 = -[SLDCollaborationAttributionViewRenderer shouldShowSnowglobeIfApplicableForVariant:](self, "shouldShowSnowglobeIfApplicableForVariant:", [v7 variant]);

  uint64_t v9 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
  BOOL v10 = -[SLDCollaborationAttributionViewRenderer shouldShowMonogramIfApplicableForVariant:](self, "shouldShowMonogramIfApplicableForVariant:", [v9 variant]);

  if ([v5 count] == 1)
  {
    size_t v11 = [v5 firstObject];
    size_t v12 = [(SLDCollaborationAttributionViewRenderer *)self newAvatarImageForConversationDrawingMetadata:v11 allowSnowglobe:v8 allowMonogram:v10];

    goto LABEL_25;
  }
  if ((unint64_t)[v5 count] < 2)
  {
    uint64_t v20 = SLDaemonLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v28 = self;
      uint64_t v21 = "[%@] SLDCollaborationAttributionViewRenderer Returning nil for avatar image because slot tag conversationDra"
            "wingMetadata was empty.";
LABEL_22:
      _os_log_impl(&dword_19BE17000, v20, OS_LOG_TYPE_INFO, v21, buf, 0xCu);
    }
LABEL_23:

LABEL_24:
    size_t v12 = 0;
    goto LABEL_25;
  }
  if (!v8)
  {
    uint64_t v20 = SLDaemonLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v28 = self;
      uint64_t v21 = "[%@] SLDCollaborationAttributionViewRenderer Returning nil for avatar image because snowglobes were not allo"
            "wed for the current variant.";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  BOOL v5 = v5;
  uint64_t v14 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v5);
        }
        double v18 = -[SLDCollaborationAttributionViewRenderer newAvatarImageForConversationDrawingMetadata:allowSnowglobe:allowMonogram:](self, "newAvatarImageForConversationDrawingMetadata:allowSnowglobe:allowMonogram:", *(void *)(*((void *)&v23 + 1) + 8 * i), 0, 1, (void)v23);
        if (v18)
        {
          uint64_t v19 = v18;
          [v13 addObject:v18];
          CFRelease(v19);
        }
      }
      uint64_t v15 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v15);
  }

  size_t v12 = [(SLDCollaborationAttributionViewRenderer *)self newSnowglobeImageWithCGImages:v13];
LABEL_25:

  return v12;
}

- (BOOL)shouldShowMonogramIfApplicableForVariant:(int64_t)a3
{
  return ((unint64_t)a3 < 6) & (0x2Du >> a3);
}

- (BOOL)shouldShowSnowglobeIfApplicableForVariant:(int64_t)a3
{
  return ((unint64_t)a3 < 6) & (0x2Du >> a3);
}

- (BOOL)shouldShowGenericIconIfApplicableForVariant:(int64_t)a3
{
  return a3 == 1 || a3 == 4;
}

- (CGRect)drawGenericGlyphInContext:(CGContext *)a3
{
  BOOL v5 = [(SLDCollaborationAttributionViewRenderer *)self metricsProvider];
  [v5 drawingSize];
  double v7 = v6;
  double v9 = v8;

  BOOL v10 = [(SLDCollaborationAttributionViewRenderer *)self slotStyle];
  double v11 = (double)[v10 displayScale];

  size_t v12 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
  id v13 = [v12 placeholderGlyphConfiguration];

  uint64_t v14 = [v13 coreUISize];
  uint64_t v15 = [v13 weight];
  [v13 pointSize];
  if (v16 > 0.0)
  {
    [v13 pointSize];
    double v19 = v20;
  }
  else
  {
    uint64_t v17 = [(SLDCollaborationAttributionViewRenderer *)self metricsProvider];
    [v17 avatarDiameter];
    double v19 = SLRoundToScale(v18, v11);
  }
  if (!v15) {
    uint64_t v15 = 4;
  }
  uint64_t v21 = [(SLDCollaborationAttributionViewRenderer *)self slotStyle];
  uint64_t v22 = SLDSystemVectorGlyphWithSlotStyle(v21, @"person.crop.circle.badge.checkmark", v14, v15, v19);

  id v23 = objc_alloc(MEMORY[0x1E4FB34A0]);
  long long v24 = [(SLDCollaborationAttributionViewRenderer *)self slotStyle];
  long long v25 = objc_msgSend(v23, "initWithVectorGlyph:tintColor:", v22, objc_msgSend(v24, "tintColor"));

  [v22 contentBoundsUnrounded];
  double v27 = v26;
  [v22 alignmentRectUnrounded];
  double v29 = v27 - v28;
  [v22 baselineOffsetUnrounded];
  double v31 = v29 - v30;
  [v22 capHeightUnrounded];
  double v33 = (v31 + v31 - v32) * 0.5;
  [v22 contentBoundsUnrounded];
  double v35 = (v7 - v34) * 0.5;
  [v22 contentBoundsUnrounded];
  double v37 = (v9 - v36) * 0.5;
  [v22 contentBoundsUnrounded];
  double v39 = v38;
  [v22 contentBoundsUnrounded];
  double v41 = v40;
  [v22 contentBoundsUnrounded];
  double v43 = v37 + v42 * 0.5 - v33;
  [v22 alignmentRectUnrounded];
  double v45 = v35 + v44;
  [v22 alignmentRectUnrounded];
  double v47 = v46 + v43;
  double v48 = SLRoundToScale(v45, v11);
  double v49 = SLRoundToScale(v47, v11);
  double v50 = v35 + v48 - v45;
  double v51 = v43 + v49 - v47;
  CGContextSaveGState(a3);
  objc_msgSend(v25, "drawInContext:atPoint:", a3, v50, v51);
  CGContextRestoreGState(a3);

  double v52 = v50;
  double v53 = v51;
  double v54 = v39;
  double v55 = v41;
  result.size.height = v55;
  result.size.width = v54;
  result.origin.y = v53;
  result.origin.x = v52;
  return result;
}

- (CGRect)drawAvatarWithImageRef:(CGImage *)a3 inContext:(CGContext *)a4
{
  double v7 = [(SLDCollaborationAttributionViewRenderer *)self metricsProvider];
  [v7 avatarDiameter];
  double v9 = v8;

  BOOL v10 = [(SLDCollaborationAttributionViewRenderer *)self metricsProvider];
  [v10 drawingSize];
  CGFloat v12 = v11 - v9;

  CGImageRetain(a3);
  CGContextSaveGState(a4);
  id v13 = [(SLDCollaborationAttributionViewRenderer *)self metricsProvider];
  [v13 drawingSize];
  CGContextTranslateCTM(a4, 0.0, v14);

  CGContextScaleCTM(a4, 1.0, -1.0);
  CGContextBeginPath(a4);
  v19.origin.x = 0.0;
  v19.origin.y = v12;
  v19.size.width = v9;
  v19.size.height = v9;
  CGContextAddEllipseInRect(a4, v19);
  CGContextClip(a4);
  CGContextClosePath(a4);
  v20.origin.x = 0.0;
  v20.origin.y = v12;
  v20.size.width = v9;
  v20.size.height = v9;
  CGContextDrawImage(a4, v20, a3);
  CGContextRestoreGState(a4);
  CGImageRelease(a3);
  double v15 = 0.0;
  double v16 = v12;
  double v17 = v9;
  double v18 = v9;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

+ (id)accessibilityLabelForTag:(id)a3
{
  id v3 = a3;
  if ((![v3 variant] || objc_msgSend(v3, "variant") == 3)
    && ([v3 collaboratorDisplayNames],
        char v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v5))
  {
    double v6 = +[SLDCollaborationAttributionViewRenderer collaboratorsStringForTag:v3 prefixingWith:1];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (BOOL)shouldShowSubtitle
{
  char v4 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
  uint64_t v5 = [v4 variant];
  if (v5)
  {
    v2 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
    if ([v2 variant] != 3)
    {
      BOOL v6 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  double v7 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
  double v8 = [v7 collaboratorDisplayNames];
  BOOL v6 = [v8 count] != 0;

  if (v5) {
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (BOOL)shouldShowLabels
{
  id v3 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
  if ([v3 variant] == 1)
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
    BOOL v4 = [v5 variant] != 4;
  }
  return v4;
}

- (double)heightForLine:(__CTLine *)a3 withOptions:(unint64_t)a4
{
  if (!a3) {
    return 0.0;
  }
  CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(a3, a4);
  CGFloat v5 = BoundsWithOptions.size.height + BoundsWithOptions.origin.y;
  CGFloat descent = 0.0;
  CTLineGetTypographicBounds(a3, 0, &descent, 0);
  return v5 + descent;
}

- (id)collaboratorsString
{
  v2 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
  id v3 = +[SLDCollaborationAttributionViewRenderer collaboratorsStringForTag:v2 prefixingWith:0];

  return v3;
}

- (id)withCollaboratorsString
{
  v2 = [(SLDCollaborationAttributionViewRenderer *)self slotTag];
  id v3 = +[SLDCollaborationAttributionViewRenderer collaboratorsStringForTag:v2 prefixingWith:1];

  return v3;
}

+ (id)collaboratorsStringForTag:(id)a3 prefixingWith:(BOOL)a4
{
  CGFloat v5 = [a3 collaboratorDisplayNames];
  BOOL v6 = (void *)[v5 mutableCopy];

  if (![v6 count])
  {
    CGFloat v12 = NSString;
    id v13 = SLFrameworkBundle();
    CGFloat v14 = v13;
    if (a4) {
      double v15 = @"With nobody";
    }
    else {
      double v15 = @"nobody";
    }
    CGRect v19 = [v13 localizedStringForKey:v15 value:&stru_1EEC19158 table:@"SocialLayer"];
    double v11 = [v12 stringWithFormat:v19];
    goto LABEL_26;
  }
  if ([v6 count] != 1)
  {
    if ([v6 count] == 2)
    {
      double v16 = NSString;
      double v17 = SLFrameworkBundle();
      CGFloat v14 = v17;
      if (a4) {
        double v18 = @"With %@ and %@";
      }
      else {
        double v18 = @"%@ and %@";
      }
      CGRect v19 = [v17 localizedStringForKey:v18 value:&stru_1EEC19158 table:@"SocialLayer"];
      long long v24 = [v6 objectAtIndexedSubscript:0];
      long long v25 = [v6 objectAtIndexedSubscript:1];
      objc_msgSend(v16, "stringWithFormat:", v19, v24, v25, v29);
    }
    else
    {
      uint64_t v20 = [v6 count];
      uint64_t v21 = NSString;
      uint64_t v22 = SLFrameworkBundle();
      CGFloat v14 = v22;
      if (v20 == 3)
      {
        if (a4) {
          id v23 = @"With %@, %@ & %@";
        }
        else {
          id v23 = @"%@, %@ & %@";
        }
        CGRect v19 = [v22 localizedStringForKey:v23 value:&stru_1EEC19158 table:@"SocialLayer"];
        long long v24 = [v6 objectAtIndexedSubscript:0];
        long long v25 = [v6 objectAtIndexedSubscript:1];
        double v27 = [v6 objectAtIndexedSubscript:2];
        double v11 = objc_msgSend(v21, "stringWithFormat:", v19, v24, v25, v27);

        goto LABEL_25;
      }
      if (a4) {
        double v26 = @"WITH_@_@_AND_N_OTHERS_FORMAT";
      }
      else {
        double v26 = @"@_@_AND_N_OTHERS_FORMAT";
      }
      CGRect v19 = [v22 localizedStringForKey:v26 value:&stru_1EEC19158 table:@"SocialLayer"];
      long long v24 = [v6 objectAtIndexedSubscript:0];
      long long v25 = [v6 objectAtIndexedSubscript:1];
      objc_msgSend(v21, "stringWithFormat:", v19, v24, v25, objc_msgSend(v6, "count") - 2);
    double v11 = };
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  if (a4)
  {
    double v7 = NSString;
    double v8 = SLFrameworkBundle();
    double v9 = [v8 localizedStringForKey:@"With %@" value:&stru_1EEC19158 table:@"SocialLayer"];
    BOOL v10 = [v6 firstObject];
    double v11 = objc_msgSend(v7, "stringWithFormat:", v9, v10);
  }
  else
  {
    double v11 = [v6 firstObject];
  }
LABEL_27:

  return v11;
}

- (void)drawLine:(__CTLine *)a3 inRect:(CGRect)a4 inContext:(CGContext *)a5
{
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGContextSaveGState(a5);
  CGContextSetFontRenderingStyle();
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeScale(&v10, 1.0, -1.0);
  CGAffineTransform v9 = v10;
  CGContextSetTextMatrix(a5, &v9);
  CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(a3, 8uLL);
  CGContextTranslateCTM(a5, x, BoundsWithOptions.origin.y + y + BoundsWithOptions.size.height);
  CTLineDraw(a3, a5);
  CGContextRestoreGState(a5);
}

- (UISSlotStyle)slotStyle
{
  return self->_slotStyle;
}

- (void)setSlotStyle:(id)a3
{
}

- (SLDCollaborationAttributionViewSlotTag)slotTag
{
  return self->_slotTag;
}

- (void)setSlotTag:(id)a3
{
}

- (BOOL)isRTL
{
  return self->_RTL;
}

- (void)setRTL:(BOOL)a3
{
  self->_RTL = a3;
}

- (SLCollaborationAttributionViewMetricsProvider)metricsProvider
{
  return self->_metricsProvider;
}

- (void)setMetricsProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsProvider, 0);
  objc_storeStrong((id *)&self->_slotTag, 0);
  objc_storeStrong((id *)&self->_slotStyle, 0);
}

- (void)newSnowglobeImageWithCGImages:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = [a2 count];
  _os_log_error_impl(&dword_19BE17000, a3, OS_LOG_TYPE_ERROR, "[%@] SLDCollaborationAttributionViewRenderer Had images, but the snowglobe image ref was still nil. cgImages.count: %li", (uint8_t *)&v4, 0x16u);
}

- (void)newMonogramImageForContact:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "[%@] SLDCollaborationAttributionViewRenderer Had a contact, but the monogram image ref was still nil. contact: %@");
}

- (void)newAvatarImageForRecipientDrawingMetadata:allowMonogram:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "[%@] SLDCollaborationAttributionViewRenderer Had contact image data, but avatar image was still nil. Falling back to monogram. %@.");
}

@end