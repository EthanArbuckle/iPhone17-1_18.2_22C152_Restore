@interface ICAttachmentDrawingModel(UI)
- (ICAttachmentDrawingActivityItemSource)activityItem;
- (id)activityItems;
- (id)attributesForSharingHTMLWithTagName:()UI textContent:;
- (id)dataForTypeIdentifier:()UI;
- (id)fileURLForTypeIdentifier:()UI;
- (id)imageForActivityItem;
- (id)providerDataTypes;
- (id)providerFileTypes;
- (uint64_t)canConvertToHTMLForSharing;
- (uint64_t)genericBrickThumbnailCreator;
- (uint64_t)genericListThumbnailCreator;
- (void)drawPreviewInRect:()UI;
- (void)saveDrawing:()UI withImage:forImageDrawing:;
@end

@implementation ICAttachmentDrawingModel(UI)

- (uint64_t)genericListThumbnailCreator
{
  return 0;
}

- (uint64_t)genericBrickThumbnailCreator
{
  return 0;
}

- (void)saveDrawing:()UI withImage:forImageDrawing:
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [a1 attachment];
  objc_msgSend(v19, "setBounds:", v12, v14, v16, v18);

  LOWORD(v19) = [v8 orientation];
  v20 = [a1 attachment];
  [v20 setOrientation:(__int16)v19];

  v21 = [a1 attachment];
  v22 = [v21 managedObjectContext];
  [v22 save:0];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__ICAttachmentDrawingModel_UI__saveDrawing_withImage_forImageDrawing___block_invoke;
  block[3] = &unk_1E5FD8DF0;
  block[4] = a1;
  dispatch_async(MEMORY[0x1E4F14428], block);
  v23 = [a1 drawing];
  uint64_t v24 = [v23 mergeWithDrawing:v8];

  if (v24 == 2)
  {
    [a1 setMergeableDataDirty:1];
    v25 = [a1 attachment];
    [v25 attachmentDidChange];
  }
  v116 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-10.0];
  v26 = [a1 drawing];
  v27 = [v26 visibleCommands];
  v28 = [v8 visibleCommands];
  int v29 = [v27 isEqualToOrderedSet:v28];

  v30 = os_log_create("com.apple.notes", "Sketching");
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
  if (v29)
  {
    if (v31) {
      -[ICAttachmentDrawingModel(UI) saveDrawing:withImage:forImageDrawing:](v30);
    }

    v32 = [a1 attachment];
    v33 = [v32 modificationDate];
    v34 = [a1 attachment];
    [v34 setPreviewUpdateDate:v33];
  }
  else
  {
    if (v31) {
      -[ICAttachmentDrawingModel(UI) saveDrawing:withImage:forImageDrawing:](v30);
    }

    v32 = +[ICAttachmentPreviewGenerator sharedGenerator];
    v33 = [a1 attachment];
    [v32 generatePreviewIfNeededForAttachment:v33];
  }

  v35 = [a1 attachment];
  v36 = v35;
  if (v9)
  {
    v37 = [v10 serializeWithPathData:0];
    v38 = [v36 updateAttachmentPreviewImageWithImage:v9 scale:1 scaleWhenDrawing:v37 metadata:0 sendNotification:1.0];

    v39 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    LODWORD(v37) = [v39 BOOLForKey:*MEMORY[0x1E4F830D0]];

    if (v37)
    {
      v40 = [a1 attachment];
      uint64_t v41 = (int)[v40 orientation];

      v42 = [a1 attachment];
      [v42 bounds];
      CGFloat v44 = v43;
      CGFloat v46 = v45;
      CGFloat v48 = v47;
      CGFloat v50 = v49;

      v51 = (void *)MEMORY[0x1E4F83368];
      [MEMORY[0x1E4F83368] defaultSize];
      objc_msgSend(v51, "fullSize:forOrientation:", v41);
      double v53 = v52;
      double v55 = v54;
      [v9 size];
      double v57 = v56;
      double v59 = v58;
      memset(&v128, 0, sizeof(v128));
      v60 = [a1 drawing];
      v61 = v60;
      if (v60) {
        [v60 orientationTransform];
      }
      else {
        memset(&v128, 0, sizeof(v128));
      }

      objc_msgSend(MEMORY[0x1E4F83368], "fullSize:forOrientation:", v41, v57, v59);
      double v63 = v62;
      double v65 = v64;
      CGAffineTransform v126 = v128;
      CGAffineTransformInvert(&v127, &v126);
      v133.origin.x = v44;
      v133.origin.y = v46;
      v133.size.width = v48;
      v133.size.height = v50;
      CGRect v134 = CGRectApplyAffineTransform(v133, &v127);
      v66 = objc_msgSend(v9, "ic_imageFromRect:", v63 / v53 * v134.origin.x, v65 / v55 * v134.origin.y, v63 / v53 * v134.size.width, v65 / v55 * v134.size.height);
      v67 = objc_msgSend(v66, "ic_JPEGDataWithOrientation:", v41);
      v68 = [a1 attachment];
      [v68 writeFallbackImageData:v67];
    }
    if (!v38)
    {
      v107 = +[ICAttachmentPreviewGenerator sharedGenerator];
      v108 = [a1 attachment];
      [v107 generatePreviewIfNeededForAttachment:v108];
      goto LABEL_42;
    }
    id v111 = v10;
    id v112 = v8;
    v69 = v9;
    objc_msgSend(v38, "setVersion:", (__int16)objc_msgSend(MEMORY[0x1E4F83370], "serializationVersion"));
    v70 = [a1 drawingDocument];
    unsigned int v71 = [v70 maxDocumentVersion];
    objc_msgSend(v38, "setVersionOutOfDate:", v71 > objc_msgSend(MEMORY[0x1E4F83370], "serializationVersion"));

    memset(&v128, 0, sizeof(v128));
    [a1 previewImageOrientationTransform];
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    v72 = +[ICPreviewDeviceContext sharedContext];
    v73 = [v72 deviceInfoScalable:1];

    uint64_t v74 = [v73 countByEnumeratingWithState:&v122 objects:v131 count:16];
    if (v74)
    {
      uint64_t v75 = v74;
      uint64_t v76 = *(void *)v123;
      long long v114 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v115 = *MEMORY[0x1E4F1DAB8];
      long long v113 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      do
      {
        for (uint64_t i = 0; i != v75; ++i)
        {
          if (*(void *)v123 != v76) {
            objc_enumerationMutation(v73);
          }
          v78 = *(void **)(*((void *)&v122 + 1) + 8 * i);
          [v78 imageSize];
          double v80 = v79;
          [v78 scale];
          v82 = objc_msgSend(v69, "ic_scaledImageMinDimension:scale:", v80, v81);
          *(_OWORD *)&v126.a = v115;
          *(_OWORD *)&v126.c = v114;
          *(_OWORD *)&v126.tx = v113;
          CGAffineTransform v121 = v128;
          v83 = [MEMORY[0x1E4F832E0] orientedImage:v82 withTransform:&v126 background:2 backgroundTransform:&v121];

          if (v83)
          {
            v84 = [a1 attachment];
            [v78 scale];
            id v85 = (id)objc_msgSend(v84, "updateAttachmentPreviewImageWithImage:scale:scaleWhenDrawing:metadata:sendNotification:", v83, 1, 0, 0);
          }
        }
        uint64_t v75 = [v73 countByEnumeratingWithState:&v122 objects:v131 count:16];
      }
      while (v75);
    }

    [v69 size];
    double v86 = *MEMORY[0x1E4F835B0];
    if (v87 > *MEMORY[0x1E4F835B0] || ([v69 size], v88 > v86))
    {
      v89 = objc_msgSend(v69, "ic_scaledImageMaxDimension:scale:", v86, 1.0);
      v90 = [a1 attachment];
      id v91 = (id)[v90 updateAttachmentPreviewImageWithImage:v89 scale:1 scaleWhenDrawing:0 metadata:0 sendNotification:1.0];
    }
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    v92 = [a1 attachment];
    v93 = [v92 previewImages];
    v94 = (void *)[v93 copy];

    uint64_t v95 = [v94 countByEnumeratingWithState:&v117 objects:v130 count:16];
    id v10 = v111;
    if (v95)
    {
      uint64_t v96 = v95;
      uint64_t v97 = *(void *)v118;
      do
      {
        for (uint64_t j = 0; j != v96; ++j)
        {
          if (*(void *)v118 != v97) {
            objc_enumerationMutation(v94);
          }
          v99 = *(void **)(*((void *)&v117 + 1) + 8 * j);
          v100 = [v99 modifiedDate];
          uint64_t v101 = [v100 compare:v116];

          if (v101 == -1)
          {
            v102 = [a1 attachment];
            [v102 removePreviewImagesObject:v99];

            v103 = [a1 attachment];
            v104 = [v103 managedObjectContext];
            [v104 deleteObject:v99];
          }
        }
        uint64_t v96 = [v94 countByEnumeratingWithState:&v117 objects:v130 count:16];
      }
      while (v96);
    }

    v105 = [a1 attachment];
    id v106 = (id)objc_msgSend(v105, "ic_postNotificationOnMainThreadAfterSaveWithName:", *MEMORY[0x1E4F83040]);

    id v8 = v112;
    id v9 = v69;
  }
  else
  {
    [v35 deleteAttachmentPreviewImages];
  }
  v107 = [a1 attachment];
  v108 = [v107 managedObjectContext];
  v109 = [a1 attachment];
  v110 = [v109 shortLoggingDescription];
  objc_msgSend(v108, "ic_saveWithLogDescription:", @"Saving drawing preview images for %@", v110);

LABEL_42:
}

- (id)imageForActivityItem
{
  v2 = [a1 attachment];
  v3 = [v2 image];

  if (!v3)
  {
    v4 = [a1 attachment];
    [MEMORY[0x1E4F83368] defaultPixelSize];
    v5 = objc_msgSend(v4, "attachmentPreviewImageWithMinSize:scale:");

    v3 = [v5 orientedImageWithBackground:1];
  }
  return v3;
}

- (ICAttachmentDrawingActivityItemSource)activityItem
{
  v2 = [ICAttachmentDrawingActivityItemSource alloc];
  v3 = [a1 attachment];
  v4 = [(ICAttachmentActivityItemSource *)v2 initWithAttachment:v3];

  return v4;
}

- (id)activityItems
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 activityItem];
  v3 = (void *)v2;
  if (v2)
  {
    v10[0] = v2;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v5 = [ICAttachmentActivityItemSource alloc];
  v6 = [a1 attachment];
  v7 = [(ICAttachmentActivityItemSource *)v5 initWithAttachment:v6];
  id v8 = [v4 arrayByAddingObject:v7];

  return v8;
}

- (id)providerDataTypes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v1 = [a1 previewImageTypeUTI];
  v4[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)providerFileTypes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v1 = [a1 previewImageTypeUTI];
  v4[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)fileURLForTypeIdentifier:()UI
{
  id v4 = a3;
  v5 = [a1 previewImageTypeUTI];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    v7 = [a1 attachment];
    [MEMORY[0x1E4F83368] defaultPixelSize];
    id v8 = objc_msgSend(v7, "attachmentPreviewImageWithMinSize:scale:");

    id v9 = [v8 orientedPreviewImageURL];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)dataForTypeIdentifier:()UI
{
  id v4 = a3;
  v5 = [a1 previewImageTypeUTI];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    v7 = [a1 attachment];
    [MEMORY[0x1E4F83368] defaultPixelSize];
    id v8 = objc_msgSend(v7, "attachmentPreviewImageWithMinSize:scale:");

    id v9 = [a1 attachment];
    int v10 = [v9 isPasswordProtected];

    if (v10)
    {
      double v11 = [a1 attachment];
      int v12 = [v11 isAuthenticated];

      if (v12)
      {
        double v13 = [v8 decryptedImageData];
      }
      else
      {
        double v13 = 0;
      }
    }
    else
    {
      double v14 = (void *)MEMORY[0x1E4F1C9B8];
      double v15 = [v8 orientedPreviewImageURL];
      double v13 = [v14 dataWithContentsOfURL:v15];
    }
  }
  else
  {
    double v13 = 0;
  }
  return v13;
}

- (id)attributesForSharingHTMLWithTagName:()UI textContent:
{
  *a3 = @"img";
  v3 = [a1 attachment];
  [MEMORY[0x1E4F83368] defaultPixelSize];
  id v4 = objc_msgSend(v3, "attachmentPreviewImageWithMinSize:scale:");

  v5 = [v4 orientedImageWithBackground:2];
  int v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "ic_JPEGData");
    id v8 = [v7 base64EncodedStringWithOptions:0];
    id v9 = (void *)MEMORY[0x1E4F832A0];
    int v10 = [(id)*MEMORY[0x1E4F44410] identifier];
    double v11 = [v9 mimeTypeFromUTI:v10];

    objc_msgSend(NSString, "stringWithFormat:", @"style=\"max-width: 100%%; max-height: 100%%;\" src=\"data:%@;base64,%@\"",
      v11,
    int v12 = v8);
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (uint64_t)canConvertToHTMLForSharing
{
  return 1;
}

- (void)drawPreviewInRect:()UI
{
  int v10 = [a1 attachment];
  [MEMORY[0x1E4F83368] defaultPixelSize];
  objc_msgSend(v10, "attachmentPreviewImageWithMinSize:scale:");
  id v30 = (id)objc_claimAutoreleasedReturnValue();

  double v11 = [v30 orientedImageWithBackground:0];
  int v12 = v11;
  if (v11)
  {
    [v11 size];
    if (v13 > 0.0)
    {
      [v12 size];
      if (v14 > 0.0 && a4 > 0.0 && a5 > 0.0)
      {
        [v12 size];
        double v16 = v15;
        [v12 size];
        CGFloat v18 = a4 / (v16 / v17);
        v19 = [a1 drawing];
        [v19 bounds];
        double v21 = v20;
        v22 = [a1 drawing];
        [v22 fullBounds];
        double v24 = v21 * (a4 / v23);

        v32.origin.double x = 0.0;
        v32.origin.double y = 0.0;
        v32.size.double width = a4;
        v32.size.double height = v18;
        CGRect v33 = CGRectOffset(v32, a2, a3 - v24);
        double x = v33.origin.x;
        double y = v33.origin.y;
        double width = v33.size.width;
        double height = v33.size.height;
        CurrentContext = UIGraphicsGetCurrentContext();
        CGContextSaveGState(CurrentContext);
        v34.origin.double x = a2;
        v34.origin.double y = a3;
        v34.size.double width = a4;
        v34.size.double height = a5;
        CGContextClipToRect(CurrentContext, v34);
        objc_msgSend(v12, "drawInRect:", x, y, width, height);
        CGContextRestoreGState(CurrentContext);
      }
    }
  }
}

- (void)saveDrawing:()UI withImage:forImageDrawing:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Drawing set image up-to-date", v1, 2u);
}

- (void)saveDrawing:()UI withImage:forImageDrawing:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Drawing set image not up-to-date", v1, 2u);
}

@end