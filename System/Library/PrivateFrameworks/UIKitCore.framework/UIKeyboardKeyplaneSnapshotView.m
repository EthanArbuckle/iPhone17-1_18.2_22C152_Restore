@interface UIKeyboardKeyplaneSnapshotView
- (UIKeyboardKeyplaneSnapshotView)initWithKeyplaneView:(id)a3;
- (id)snapshotFromView:(id)a3;
- (void)setAlpha:(double)a3;
@end

@implementation UIKeyboardKeyplaneSnapshotView

- (UIKeyboardKeyplaneSnapshotView)initWithKeyplaneView:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 bounds];
  v82.receiver = self;
  v82.super_class = (Class)UIKeyboardKeyplaneSnapshotView;
  v5 = -[UIView initWithFrame:](&v82, sel_initWithFrame_);
  v6 = v5;
  if (v5)
  {
    p_isa = (id *)&v5->super.super.super.isa;
    v7 = [(UIView *)v5 layer];
    [v7 setAllowsGroupBlending:0];

    v8 = [MEMORY[0x1E4F1CA48] array];
    v9 = [MEMORY[0x1E4F1CA48] array];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v53 = v4;
    obuint64_t j = [v4 subviews];
    uint64_t v57 = [obj countByEnumeratingWithState:&v78 objects:v88 count:16];
    v10 = 0;
    if (v57)
    {
      uint64_t v56 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v57; ++i)
        {
          if (*(void *)v79 != v56) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          v13 = [v12 layer];
          v14 = [v13 sublayers];

          uint64_t v15 = [v14 countByEnumeratingWithState:&v74 objects:v87 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v75;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v75 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*((void *)&v74 + 1) + 8 * j);
                if (([v19 isHidden] & 1) == 0)
                {
                  v20 = [v19 compositingFilter];

                  if (v20)
                  {
                    uint64_t v21 = [v19 compositingFilter];

                    v22 = v9;
                    v10 = (void *)v21;
                  }
                  else
                  {
                    v22 = v8;
                  }
                  [v22 addObject:v19];
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v74 objects:v87 count:16];
            }
            while (v16);
          }
        }
        uint64_t v57 = [obj countByEnumeratingWithState:&v78 objects:v88 count:16];
      }
      while (v57);
    }

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v23 = v8;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v70 objects:v86 count:16];
    id v4 = v53;
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v71;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v71 != v26) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v70 + 1) + 8 * k) setHidden:1];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v70 objects:v86 count:16];
      }
      while (v25);
    }

    v28 = [UIImageView alloc];
    [p_isa bounds];
    uint64_t v29 = -[UIImageView initWithFrame:](v28, "initWithFrame:");
    id v30 = p_isa[52];
    p_isa[52] = (id)v29;

    v31 = [p_isa snapshotFromView:v53];
    [p_isa[52] setImage:v31];

    v32 = [p_isa[52] layer];
    [v32 setCompositingFilter:v10];

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v33 = v23;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v66 objects:v85 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v67;
      do
      {
        for (uint64_t m = 0; m != v35; ++m)
        {
          if (*(void *)v67 != v36) {
            objc_enumerationMutation(v33);
          }
          [*(id *)(*((void *)&v66 + 1) + 8 * m) setHidden:0];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v66 objects:v85 count:16];
      }
      while (v35);
    }

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v38 = v9;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v62 objects:v84 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v63;
      do
      {
        for (uint64_t n = 0; n != v40; ++n)
        {
          if (*(void *)v63 != v41) {
            objc_enumerationMutation(v38);
          }
          [*(id *)(*((void *)&v62 + 1) + 8 * n) setHidden:1];
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v62 objects:v84 count:16];
      }
      while (v40);
    }

    v43 = [UIImageView alloc];
    [p_isa bounds];
    uint64_t v44 = -[UIImageView initWithFrame:](v43, "initWithFrame:");
    id v45 = p_isa[51];
    p_isa[51] = (id)v44;

    v46 = [p_isa snapshotFromView:v53];
    [p_isa[51] setImage:v46];

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v47 = v38;
    uint64_t v48 = [v47 countByEnumeratingWithState:&v58 objects:v83 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v59;
      do
      {
        for (iuint64_t i = 0; ii != v49; ++ii)
        {
          if (*(void *)v59 != v50) {
            objc_enumerationMutation(v47);
          }
          [*(id *)(*((void *)&v58 + 1) + 8 * ii) setHidden:0];
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v58 objects:v83 count:16];
      }
      while (v49);
    }

    v6 = (UIKeyboardKeyplaneSnapshotView *)p_isa;
    [p_isa addSubview:p_isa[52]];
    [(UIView *)v6 addSubview:v6->_fgView];
  }
  return v6;
}

- (id)snapshotFromView:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 window];
    v6 = [v5 screen];
    [v6 scale];

    v7 = [UIGraphicsImageRenderer alloc];
    [v4 frame];
    double v9 = v8;
    double v11 = v10;
    v12 = [v4 traitCollection];
    v13 = +[UIGraphicsImageRendererFormat formatForTraitCollection:v12];
    v14 = -[UIGraphicsImageRenderer initWithSize:format:](v7, "initWithSize:format:", v13, v9, v11);

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__UIKeyboardKeyplaneSnapshotView_snapshotFromView___block_invoke;
    v17[3] = &unk_1E52DD280;
    id v18 = v4;
    uint64_t v15 = [(UIGraphicsImageRenderer *)v14 imageWithActions:v17];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

void __51__UIKeyboardKeyplaneSnapshotView_snapshotFromView___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 layer];
  uint64_t v4 = [v3 CGContext];

  [v5 renderInContext:v4];
}

- (void)setAlpha:(double)a3
{
  float v4 = a3;
  id v5 = [(UIView *)self->_fgView layer];
  *(float *)&double v6 = v4;
  [v5 setOpacity:v6];

  id v8 = [(UIView *)self->_bgView layer];
  *(float *)&double v7 = v4;
  [v8 setOpacity:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bgView, 0);
  objc_storeStrong((id *)&self->_fgView, 0);
}

@end