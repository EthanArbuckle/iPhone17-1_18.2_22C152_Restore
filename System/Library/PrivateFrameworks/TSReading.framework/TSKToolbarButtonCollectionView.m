@interface TSKToolbarButtonCollectionView
- (TSKToolbarButtonCollectionView)initWithHeight:(double)a3 items:(id)a4 maximumWidth:(double)a5;
@end

@implementation TSKToolbarButtonCollectionView

- (TSKToolbarButtonCollectionView)initWithHeight:(double)a3 items:(id)a4 maximumWidth:(double)a5
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  v68.receiver = self;
  v68.super_class = (Class)TSKToolbarButtonCollectionView;
  double v8 = 0.0;
  v9 = -[TSKToolbarButtonCollectionView initWithFrame:](&v68, sel_initWithFrame_, 0.0, 0.0, 0.0, a3);
  if (v9)
  {
    v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a4, "count"));
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v11 = [a4 countByEnumeratingWithState:&v64 objects:v70 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      char v59 = 0;
      uint64_t v13 = *(void *)v65;
      unint64_t v14 = 0x263F1C000uLL;
      v15 = off_2646AE000;
      unint64_t v16 = 0x263F1C000uLL;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v65 != v13) {
            objc_enumerationMutation(a4);
          }
          v18 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v18 bounds];
            double v20 = v19;
            double v22 = v21;
            [(TSKToolbarButtonCollectionView *)v9 addSubview:v18];
            if (v59) {
              double v23 = v8 + 5.0;
            }
            else {
              double v23 = v8;
            }
            TSURound();
            objc_msgSend(v18, "setFrame:", v23, v24, v20, v22);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v18 frame];
              [v18 setHitBufferTop:v26 left:5.0 bottom:a3 - (v26 + v25) right:5.0];
            }
            double v8 = v23 + v20;
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
            if (a5 > 0.0 && (isKindOfClass & 1) != 0) {
              [v10 addObject:v18];
            }
            char v59 = 1;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v18 width];
              char v59 = 0;
              double v8 = v8 + v28;
            }
            else
            {
              v58 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
              v29 = v10;
              unint64_t v30 = v16;
              uint64_t v31 = v12;
              uint64_t v32 = v13;
              unint64_t v33 = v14;
              v34 = v15;
              uint64_t v35 = [NSString stringWithUTF8String:"-[TSKToolbarButtonCollectionView initWithHeight:items:maximumWidth:]"];
              uint64_t v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKToolbar.m"];
              uint64_t v37 = v35;
              v15 = v34;
              unint64_t v14 = v33;
              uint64_t v13 = v32;
              uint64_t v12 = v31;
              unint64_t v16 = v30;
              v10 = v29;
              [v58 handleFailureInFunction:v37 file:v36 lineNumber:336 description:@"Something other than a UIView or a TSKToolbarSpace found"];
            }
          }
        }
        uint64_t v12 = [a4 countByEnumeratingWithState:&v64 objects:v70 count:16];
      }
      while (v12);
    }
    if (a5 <= 0.0)
    {
      double v39 = v8;
    }
    else
    {
      while (v8 > a5)
      {
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        uint64_t v38 = [v10 countByEnumeratingWithState:&v60 objects:v69 count:16];
        double v39 = v8;
        if (v38)
        {
          uint64_t v40 = v38;
          uint64_t v41 = *(void *)v61;
          double v39 = v8;
          do
          {
            uint64_t v42 = 0;
            do
            {
              if (*(void *)v61 != v41) {
                objc_enumerationMutation(v10);
              }
              v43 = *(void **)(*((void *)&v60 + 1) + 8 * v42);
              [v43 frame];
              [v43 frame];
              double v45 = v44;
              v46 = objc_msgSend((id)objc_msgSend(v43, "titleLabel"), "font");
              [v46 pointSize];
              if (v47 >= 1.0)
              {
                objc_msgSend((id)objc_msgSend(v43, "titleLabel"), "setFont:", objc_msgSend(v46, "fontWithSize:", v47 + -1.0));
                [v43 sizeToFit];
                [v43 frame];
                double v49 = v45 - v48;
                objc_msgSend(v43, "setFrame:");
                double v39 = v39 - v49;
                for (unint64_t j = [a4 indexOfObject:v43] + 1; j < objc_msgSend(a4, "count"); ++j)
                {
                  v51 = (void *)[a4 objectAtIndex:j];
                  if (objc_msgSend((id)-[TSKToolbarButtonCollectionView subviews](v9, "subviews"), "containsObject:", v51))
                  {
                    [v51 frame];
                    [v51 setFrame:v52 - v49];
                  }
                }
              }
              ++v42;
            }
            while (v42 != v40);
            uint64_t v53 = [v10 countByEnumeratingWithState:&v60 objects:v69 count:16];
            uint64_t v40 = v53;
          }
          while (v53);
        }
        BOOL v54 = v39 == v8;
        double v8 = v39;
        if (v54) {
          goto LABEL_43;
        }
      }
      double v39 = v8;
LABEL_43:
      if (v39 > a5)
      {
        v55 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v56 = [NSString stringWithUTF8String:"-[TSKToolbarButtonCollectionView initWithHeight:items:maximumWidth:]"];
        objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKToolbar.m"), 397, @"Unable to reduce width to %g; going with %g",
          *(void *)&a5,
          *(void *)&v39);
      }
    }
    -[TSKToolbarButtonCollectionView setFrame:](v9, "setFrame:", 0.0, 0.0, v39, a3);
  }
  return v9;
}

@end