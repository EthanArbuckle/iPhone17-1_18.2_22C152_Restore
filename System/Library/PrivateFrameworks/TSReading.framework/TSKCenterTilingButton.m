@interface TSKCenterTilingButton
- (TSKCenterTilingButton)initWithFrame:(CGRect)a3;
- (TSKCenterTilingButton)initWithFrame:(CGRect)a3 andTilingType:(int)a4;
- (id)centerTileImageForState:(unint64_t)a3;
- (id)leftCapImageForState:(unint64_t)a3;
- (id)leftCenterTileImageForState:(unint64_t)a3;
- (id)rightCapImageForState:(unint64_t)a3;
- (id)rightCenterTileImageForState:(unint64_t)a3;
- (void)dealloc;
- (void)p_resetBackgroundImageForState:(unint64_t)a3;
- (void)p_tileButtedToCapLtoR:(id)a3 inRect:(CGRect)a4;
- (void)p_tileButtedToCapRtoL:(id)a3 inRect:(CGRect)a4;
- (void)p_tileHorizCenterOutwardwithLeft:(id)a3 andRight:(id)a4 inRect:(CGRect)a5;
- (void)p_tileSimple:(id)a3 inRect:(CGRect)a4;
- (void)setCenterTileImage:(id)a3 forState:(unint64_t)a4;
- (void)setLeftCapImage:(id)a3 forState:(unint64_t)a4;
- (void)setLeftCenterTileImage:(id)a3 forState:(unint64_t)a4;
- (void)setRightCapImage:(id)a3 forState:(unint64_t)a4;
- (void)setRightCenterTileImage:(id)a3 forState:(unint64_t)a4;
@end

@implementation TSKCenterTilingButton

- (TSKCenterTilingButton)initWithFrame:(CGRect)a3
{
  return -[TSKCenterTilingButton initWithFrame:andTilingType:](self, "initWithFrame:andTilingType:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (TSKCenterTilingButton)initWithFrame:(CGRect)a3 andTilingType:(int)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSKCenterTilingButton;
  result = -[TSKCenterTilingButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->mTilingType = a4;
  }
  return result;
}

- (void)dealloc
{
  self->mLeftCapImage_Normal = 0;
  self->mLeftCapImage_Disabled = 0;

  self->mLeftCapImage_Active = 0;
  self->mLeftCapImage_Selected = 0;

  self->mLeftCapImage_ActiveSelected = 0;
  self->mRightCapImage_Normal = 0;

  self->mRightCapImage_Disabled = 0;
  self->mRightCapImage_Active = 0;

  self->mRightCapImage_Selected = 0;
  self->mRightCapImage_ActiveSelected = 0;

  self->mCenterTileImage_Normal = 0;
  self->mCenterTileImage_Disabled = 0;

  self->mCenterTileImage_Active = 0;
  self->mCenterTileImage_Selected = 0;

  self->mCenterTileImage_ActiveSelected = 0;
  self->mLeftCenterTileImage_Normal = 0;

  self->mLeftCenterTileImage_Disabled = 0;
  self->mLeftCenterTileImage_Active = 0;

  self->mLeftCenterTileImage_Selected = 0;
  self->mLeftCenterTileImage_ActiveSelected = 0;

  self->mRightCenterTileImage_Normal = 0;
  self->mRightCenterTileImage_Disabled = 0;

  self->mRightCenterTileImage_Active = 0;
  self->mRightCenterTileImage_Selected = 0;

  self->mRightCenterTileImage_ActiveSelected = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSKCenterTilingButton;
  [(TSKCenterTilingButton *)&v3 dealloc];
}

- (id)leftCapImageForState:(unint64_t)a3
{
  if ((a3 & 2) != 0)
  {
    mLeftCapImage_Disabled = self->mLeftCapImage_Disabled;
    if (mLeftCapImage_Disabled) {
      return mLeftCapImage_Disabled;
    }
  }
  unint64_t v4 = a3 & 5;
  switch(v4)
  {
    case 5uLL:
      mLeftCapImage_Disabled = self->mLeftCapImage_ActiveSelected;
      if (mLeftCapImage_Disabled) {
        return mLeftCapImage_Disabled;
      }
      mLeftCapImage_Disabled = self->mLeftCapImage_Active;
      if (mLeftCapImage_Disabled) {
        return mLeftCapImage_Disabled;
      }
      break;
    case 4uLL:
      break;
    case 1uLL:
      uint64_t v5 = 760;
      goto LABEL_10;
    default:
      return self->mLeftCapImage_Normal;
  }
  uint64_t v5 = 768;
LABEL_10:
  mLeftCapImage_Disabled = *(UIImage **)((char *)&self->super.super.super.super.super.isa + v5);
  if (!mLeftCapImage_Disabled) {
    return self->mLeftCapImage_Normal;
  }
  return mLeftCapImage_Disabled;
}

- (id)rightCapImageForState:(unint64_t)a3
{
  if ((a3 & 2) != 0)
  {
    mRightCapImage_Disabled = self->mRightCapImage_Disabled;
    if (mRightCapImage_Disabled) {
      return mRightCapImage_Disabled;
    }
  }
  unint64_t v4 = a3 & 5;
  switch(v4)
  {
    case 5uLL:
      mRightCapImage_Disabled = self->mRightCapImage_ActiveSelected;
      if (mRightCapImage_Disabled) {
        return mRightCapImage_Disabled;
      }
      mRightCapImage_Disabled = self->mRightCapImage_Active;
      if (mRightCapImage_Disabled) {
        return mRightCapImage_Disabled;
      }
      break;
    case 4uLL:
      break;
    case 1uLL:
      uint64_t v5 = 800;
      goto LABEL_10;
    default:
      return self->mRightCapImage_Normal;
  }
  uint64_t v5 = 808;
LABEL_10:
  mRightCapImage_Disabled = *(UIImage **)((char *)&self->super.super.super.super.super.isa + v5);
  if (!mRightCapImage_Disabled) {
    return self->mRightCapImage_Normal;
  }
  return mRightCapImage_Disabled;
}

- (id)centerTileImageForState:(unint64_t)a3
{
  if ((a3 & 2) != 0)
  {
    mCenterTileImage_Disabled = self->mCenterTileImage_Disabled;
    if (mCenterTileImage_Disabled) {
      return mCenterTileImage_Disabled;
    }
  }
  unint64_t v4 = a3 & 5;
  switch(v4)
  {
    case 5uLL:
      mCenterTileImage_Disabled = self->mCenterTileImage_ActiveSelected;
      if (mCenterTileImage_Disabled) {
        return mCenterTileImage_Disabled;
      }
      mCenterTileImage_Disabled = self->mCenterTileImage_Active;
      if (mCenterTileImage_Disabled) {
        return mCenterTileImage_Disabled;
      }
      break;
    case 4uLL:
      break;
    case 1uLL:
      uint64_t v5 = 840;
      goto LABEL_10;
    default:
      return self->mCenterTileImage_Normal;
  }
  uint64_t v5 = 848;
LABEL_10:
  mCenterTileImage_Disabled = *(UIImage **)((char *)&self->super.super.super.super.super.isa + v5);
  if (!mCenterTileImage_Disabled) {
    return self->mCenterTileImage_Normal;
  }
  return mCenterTileImage_Disabled;
}

- (id)leftCenterTileImageForState:(unint64_t)a3
{
  if (self->mTilingType != 3) {
    return 0;
  }
  if ((a3 & 2) == 0 || (mLeftCenterTileImage_ActiveSelected = self->mLeftCenterTileImage_Disabled) == 0)
  {
    unint64_t v4 = a3 & 5;
    switch(v4)
    {
      case 5uLL:
        mLeftCenterTileImage_ActiveSelected = self->mLeftCenterTileImage_ActiveSelected;
        if (mLeftCenterTileImage_ActiveSelected) {
          return mLeftCenterTileImage_ActiveSelected;
        }
        mLeftCenterTileImage_ActiveSelected = self->mLeftCenterTileImage_Active;
        if (mLeftCenterTileImage_ActiveSelected) {
          return mLeftCenterTileImage_ActiveSelected;
        }
        break;
      case 4uLL:
        break;
      case 1uLL:
        uint64_t v5 = 880;
        goto LABEL_12;
      default:
        return self->mLeftCenterTileImage_Normal;
    }
    uint64_t v5 = 888;
LABEL_12:
    mLeftCenterTileImage_ActiveSelected = *(UIImage **)((char *)&self->super.super.super.super.super.isa + v5);
    if (!mLeftCenterTileImage_ActiveSelected) {
      return self->mLeftCenterTileImage_Normal;
    }
  }
  return mLeftCenterTileImage_ActiveSelected;
}

- (id)rightCenterTileImageForState:(unint64_t)a3
{
  if (self->mTilingType != 3) {
    return 0;
  }
  if ((a3 & 2) == 0 || (mRightCenterTileImage_ActiveSelected = self->mRightCenterTileImage_Disabled) == 0)
  {
    unint64_t v4 = a3 & 5;
    switch(v4)
    {
      case 5uLL:
        mRightCenterTileImage_ActiveSelected = self->mRightCenterTileImage_ActiveSelected;
        if (mRightCenterTileImage_ActiveSelected) {
          return mRightCenterTileImage_ActiveSelected;
        }
        mRightCenterTileImage_ActiveSelected = self->mRightCenterTileImage_Active;
        if (mRightCenterTileImage_ActiveSelected) {
          return mRightCenterTileImage_ActiveSelected;
        }
        break;
      case 4uLL:
        break;
      case 1uLL:
        uint64_t v5 = 920;
        goto LABEL_12;
      default:
        return self->mRightCenterTileImage_Normal;
    }
    uint64_t v5 = 928;
LABEL_12:
    mRightCenterTileImage_ActiveSelected = *(UIImage **)((char *)&self->super.super.super.super.super.isa + v5);
    if (!mRightCenterTileImage_ActiveSelected) {
      return self->mRightCenterTileImage_Normal;
    }
  }
  return mRightCenterTileImage_ActiveSelected;
}

- (void)setLeftCapImage:(id)a3 forState:(unint64_t)a4
{
  if ((a4 & 2) != 0)
  {
    v8 = &OBJC_IVAR___TSKCenterTilingButton_mLeftCapImage_Disabled;
  }
  else
  {
    unint64_t v7 = (a4 & 5) - 1;
    if (v7 > 4) {
      v8 = &OBJC_IVAR___TSKCenterTilingButton_mLeftCapImage_Normal;
    }
    else {
      v8 = off_2646B0B40[v7];
    }
  }
  id v9 = a3;
  uint64_t v10 = *v8;

  *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = (Class)a3;

  [(TSKCenterTilingButton *)self p_resetBackgroundImageForState:a4];
}

- (void)setRightCapImage:(id)a3 forState:(unint64_t)a4
{
  if ((a4 & 2) != 0)
  {
    v8 = &OBJC_IVAR___TSKCenterTilingButton_mRightCapImage_Disabled;
  }
  else
  {
    unint64_t v7 = (a4 & 5) - 1;
    if (v7 > 4) {
      v8 = &OBJC_IVAR___TSKCenterTilingButton_mRightCapImage_Normal;
    }
    else {
      v8 = off_2646B0B68[v7];
    }
  }
  id v9 = a3;
  uint64_t v10 = *v8;

  *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = (Class)a3;

  [(TSKCenterTilingButton *)self p_resetBackgroundImageForState:a4];
}

- (void)setCenterTileImage:(id)a3 forState:(unint64_t)a4
{
  if ((a4 & 2) != 0)
  {
    v8 = &OBJC_IVAR___TSKCenterTilingButton_mCenterTileImage_Disabled;
  }
  else
  {
    unint64_t v7 = (a4 & 5) - 1;
    if (v7 > 4) {
      v8 = &OBJC_IVAR___TSKCenterTilingButton_mCenterTileImage_Normal;
    }
    else {
      v8 = off_2646B0B90[v7];
    }
  }
  id v9 = a3;
  uint64_t v10 = *v8;

  *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = (Class)a3;

  [(TSKCenterTilingButton *)self p_resetBackgroundImageForState:a4];
}

- (void)setLeftCenterTileImage:(id)a3 forState:(unint64_t)a4
{
  if ((a4 & 2) != 0)
  {
    v8 = &OBJC_IVAR___TSKCenterTilingButton_mLeftCenterTileImage_Disabled;
  }
  else
  {
    unint64_t v7 = (a4 & 5) - 1;
    if (v7 > 4) {
      v8 = &OBJC_IVAR___TSKCenterTilingButton_mLeftCenterTileImage_Normal;
    }
    else {
      v8 = off_2646B0BB8[v7];
    }
  }
  id v9 = a3;
  uint64_t v10 = *v8;

  *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = (Class)a3;

  [(TSKCenterTilingButton *)self p_resetBackgroundImageForState:a4];
}

- (void)setRightCenterTileImage:(id)a3 forState:(unint64_t)a4
{
  if ((a4 & 2) != 0)
  {
    v8 = &OBJC_IVAR___TSKCenterTilingButton_mRightCenterTileImage_Disabled;
  }
  else
  {
    unint64_t v7 = (a4 & 5) - 1;
    if (v7 > 4) {
      v8 = &OBJC_IVAR___TSKCenterTilingButton_mRightCenterTileImage_Normal;
    }
    else {
      v8 = off_2646B0BE0[v7];
    }
  }
  id v9 = a3;
  uint64_t v10 = *v8;

  *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = (Class)a3;

  [(TSKCenterTilingButton *)self p_resetBackgroundImageForState:a4];
}

- (void)p_resetBackgroundImageForState:(unint64_t)a3
{
  id v5 = -[TSKCenterTilingButton leftCapImageForState:](self, "leftCapImageForState:");
  id v6 = [(TSKCenterTilingButton *)self rightCapImageForState:a3];
  id v7 = [(TSKCenterTilingButton *)self centerTileImageForState:a3];
  id v8 = [(TSKCenterTilingButton *)self leftCenterTileImageForState:a3];
  id v9 = [(TSKCenterTilingButton *)self rightCenterTileImageForState:a3];
  double v10 = 1.0;
  double v11 = 1.0;
  if (v5)
  {
    [v5 scale];
    double v11 = v12;
  }
  if (v6)
  {
    [v6 scale];
    double v10 = v13;
  }
  if (v9)
  {
    [v9 scale];
    double v15 = v14;
    if (v8) {
      goto LABEL_7;
    }
LABEL_12:
    if (v7)
    {
      [v7 scale];
      if (v23 >= 1.0)
      {
        [v7 scale];
        if (v15 > v29) {
          goto LABEL_15;
        }
      }
      else if (v15 > 1.0)
      {
        goto LABEL_15;
      }
      [v7 scale];
      double v31 = v30;
      double v27 = 1.0;
      if (v31 < 1.0)
      {
LABEL_29:
        BOOL v18 = 0;
        goto LABEL_37;
      }
LABEL_28:
      [v7 scale];
      goto LABEL_29;
    }
    double v27 = 1.0;
    BOOL v18 = 1;
    if (v15 <= 1.0) {
      goto LABEL_37;
    }
    goto LABEL_23;
  }
  double v15 = 1.0;
  if (!v8) {
    goto LABEL_12;
  }
LABEL_7:
  [v8 scale];
  double v17 = v16;
  BOOL v18 = v7 == 0;
  if (v7)
  {
    [v7 scale];
    if (v17 <= v19)
    {
      [v7 scale];
      if (v15 <= v20)
      {
        [v8 scale];
        double v22 = v21;
        goto LABEL_20;
      }
LABEL_15:
      BOOL v18 = 0;
      if (!v9)
      {
LABEL_32:
        double v32 = 1.0;
        if (v10 > 1.0) {
          goto LABEL_38;
        }
LABEL_43:
        if (v8) {
          goto LABEL_44;
        }
        goto LABEL_56;
      }
LABEL_24:
      [v9 scale];
      if (v10 > v28) {
        goto LABEL_38;
      }
LABEL_42:
      [v9 scale];
      double v32 = v35;
      goto LABEL_43;
    }
  }
  else if (v16 <= 1.0)
  {
    if (v15 > 1.0)
    {
      BOOL v18 = 1;
      if (!v9) {
        goto LABEL_32;
      }
      goto LABEL_24;
    }
    [v8 scale];
    double v22 = v33;
LABEL_35:
    double v27 = 1.0;
    BOOL v18 = 1;
    if (v22 <= 1.0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  [v8 scale];
  if (v15 > v24)
  {
LABEL_23:
    if (!v9) {
      goto LABEL_32;
    }
    goto LABEL_24;
  }
  [v8 scale];
  double v22 = v25;
  if (!v7) {
    goto LABEL_35;
  }
LABEL_20:
  [v7 scale];
  if (v22 <= v26) {
    goto LABEL_28;
  }
  BOOL v18 = 0;
LABEL_36:
  [v8 scale];
LABEL_37:
  if (v10 > v27)
  {
LABEL_38:
    if (v6)
    {
      [v6 scale];
      if (v11 <= v34)
      {
LABEL_78:
        [v6 scale];
        double v40 = v55;
        goto LABEL_79;
      }
    }
    else
    {
      double v40 = 1.0;
      if (v11 <= 1.0)
      {
LABEL_79:
        if (v9) {
          goto LABEL_80;
        }
        goto LABEL_93;
      }
    }
    goto LABEL_75;
  }
  if (v9) {
    goto LABEL_42;
  }
  double v32 = 1.0;
  if (v8)
  {
LABEL_44:
    [v8 scale];
    double v37 = v36;
    if (v18)
    {
      if (v36 <= 1.0)
      {
        if (v32 <= 1.0)
        {
          [v8 scale];
          double v39 = v38;
          goto LABEL_53;
        }
        goto LABEL_68;
      }
    }
    else
    {
      [v7 scale];
      if (v37 <= v41)
      {
        [v7 scale];
        if (v32 <= v46)
        {
          [v8 scale];
          double v39 = v47;
LABEL_65:
          [v7 scale];
          if (v39 > v48)
          {
LABEL_66:
            v49 = v8;
LABEL_73:
            [v49 scale];
            goto LABEL_74;
          }
LABEL_72:
          v49 = v7;
          goto LABEL_73;
        }
LABEL_68:
        if (!v9)
        {
          double v44 = 1.0;
          goto LABEL_74;
        }
        goto LABEL_69;
      }
    }
    [v8 scale];
    if (v32 <= v42)
    {
      [v8 scale];
      double v39 = v43;
      if (v18)
      {
LABEL_53:
        double v44 = 1.0;
        if (v39 <= 1.0) {
          goto LABEL_74;
        }
        goto LABEL_66;
      }
      goto LABEL_65;
    }
    goto LABEL_68;
  }
LABEL_56:
  if (!v18)
  {
    [v7 scale];
    if (v45 >= 1.0)
    {
      [v7 scale];
      if (v32 > v50) {
        goto LABEL_68;
      }
    }
    else if (v32 > 1.0)
    {
      goto LABEL_68;
    }
    [v7 scale];
    double v52 = v51;
    double v44 = 1.0;
    if (v52 < 1.0) {
      goto LABEL_74;
    }
    goto LABEL_72;
  }
  double v44 = 1.0;
  if (v9 && v32 > 1.0)
  {
LABEL_69:
    v49 = v9;
    goto LABEL_73;
  }
LABEL_74:
  if (v11 <= v44)
  {
    if (!v6)
    {
      double v40 = 1.0;
      if (v9)
      {
LABEL_80:
        [v9 scale];
        double v57 = v56;
        if (v8) {
          goto LABEL_81;
        }
        goto LABEL_94;
      }
LABEL_93:
      double v57 = 1.0;
      if (v8)
      {
LABEL_81:
        [v8 scale];
        double v59 = v58;
        if (v18)
        {
          if (v58 <= 1.0)
          {
            if (v57 <= 1.0)
            {
              [v8 scale];
              double v61 = v60;
              goto LABEL_90;
            }
LABEL_105:
            if (!v9)
            {
              double v74 = 1.0;
              if (v40 > 1.0) {
                goto LABEL_114;
              }
LABEL_118:
              if (v8) {
                goto LABEL_119;
              }
              goto LABEL_129;
            }
            [v9 scale];
            if (v40 > v73) {
              goto LABEL_114;
            }
LABEL_117:
            [v9 scale];
            double v74 = v78;
            goto LABEL_118;
          }
        }
        else
        {
          [v7 scale];
          if (v59 <= v63)
          {
            [v7 scale];
            if (v57 > v68) {
              goto LABEL_105;
            }
            [v8 scale];
            double v61 = v69;
LABEL_102:
            [v7 scale];
            if (v61 > v70)
            {
LABEL_103:
              v71 = v8;
LABEL_112:
              [v71 scale];
              goto LABEL_113;
            }
            goto LABEL_111;
          }
        }
        [v8 scale];
        if (v57 > v64) {
          goto LABEL_105;
        }
        [v8 scale];
        double v61 = v65;
        if (v18)
        {
LABEL_90:
          double v66 = 1.0;
          if (v61 <= 1.0) {
            goto LABEL_113;
          }
          goto LABEL_103;
        }
        goto LABEL_102;
      }
LABEL_94:
      if (v18)
      {
        double v66 = 1.0;
        if (v57 <= 1.0)
        {
LABEL_113:
          if (v40 > v66)
          {
LABEL_114:
            if (v6)
            {
              v77 = v6;
LABEL_146:
              [v77 scale];
              CGFloat v54 = v92;
              goto LABEL_147;
            }
LABEL_143:
            CGFloat v54 = 1.0;
            goto LABEL_147;
          }
          if (!v9)
          {
            double v74 = 1.0;
            if (v8)
            {
LABEL_119:
              [v8 scale];
              double v80 = v79;
              if (v18)
              {
                if (v79 <= 1.0)
                {
                  if (v74 <= 1.0)
                  {
                    [v8 scale];
                    double v82 = v81;
                    goto LABEL_126;
                  }
                  goto LABEL_141;
                }
              }
              else
              {
                [v7 scale];
                if (v80 <= v83)
                {
                  [v7 scale];
                  if (v74 <= v87)
                  {
                    [v8 scale];
                    double v82 = v88;
LABEL_138:
                    [v7 scale];
                    if (v82 > v89) {
                      goto LABEL_139;
                    }
LABEL_145:
                    v77 = v7;
                    goto LABEL_146;
                  }
LABEL_141:
                  if (!v9) {
                    goto LABEL_143;
                  }
                  goto LABEL_142;
                }
              }
              [v8 scale];
              if (v74 <= v84)
              {
                [v8 scale];
                double v82 = v85;
                if (v18)
                {
LABEL_126:
                  CGFloat v54 = 1.0;
                  if (v82 <= 1.0) {
                    goto LABEL_147;
                  }
LABEL_139:
                  v77 = v8;
                  goto LABEL_146;
                }
                goto LABEL_138;
              }
              goto LABEL_141;
            }
LABEL_129:
            if (v18)
            {
              CGFloat v54 = 1.0;
              if (!v9 || v74 <= 1.0)
              {
LABEL_147:
                if (!v5)
                {
                  double v62 = 0.0;
                  if (v6) {
                    goto LABEL_149;
                  }
                  goto LABEL_151;
                }
                goto LABEL_148;
              }
LABEL_142:
              v77 = v9;
              goto LABEL_146;
            }
            [v7 scale];
            if (v86 >= 1.0)
            {
              [v7 scale];
              if (v74 > v90) {
                goto LABEL_141;
              }
            }
            else if (v74 > 1.0)
            {
              goto LABEL_141;
            }
            [v7 scale];
            CGFloat v54 = 1.0;
            if (v91 < 1.0) {
              goto LABEL_147;
            }
            goto LABEL_145;
          }
          goto LABEL_117;
        }
        goto LABEL_105;
      }
      [v7 scale];
      if (v67 >= 1.0)
      {
        [v7 scale];
        if (v57 > v72) {
          goto LABEL_105;
        }
      }
      else if (v57 > 1.0)
      {
        goto LABEL_105;
      }
      [v7 scale];
      double v76 = v75;
      double v66 = 1.0;
      if (v76 < 1.0) {
        goto LABEL_113;
      }
LABEL_111:
      v71 = v7;
      goto LABEL_112;
    }
    goto LABEL_78;
  }
LABEL_75:
  if (v5)
  {
    [v5 scale];
    CGFloat v54 = v53;
LABEL_148:
    [v5 size];
    double v62 = v93;
    if (v6) {
      goto LABEL_149;
    }
    goto LABEL_151;
  }
  double v62 = 0.0;
  CGFloat v54 = 1.0;
  if (v6)
  {
LABEL_149:
    [v6 size];
    double v95 = v94;
    goto LABEL_152;
  }
LABEL_151:
  double v95 = 0.0;
LABEL_152:
  [(TSKCenterTilingButton *)self bounds];
  double v97 = v96;
  double v99 = v98;
  double v100 = v62 + v95;
  [(TSKCenterTilingButton *)self bounds];
  v113.width = v101;
  v113.height = v102;
  UIGraphicsBeginImageContextWithOptions(v113, 0, v54);
  if (v5) {
    objc_msgSend(v5, "drawAtPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  }
  double v103 = v97 - v100;
  int mTilingType = self->mTilingType;
  if (v18)
  {
    if (v9 && v8 && mTilingType == 3)
    {
      v105 = self;
      id v106 = v8;
      id v107 = v9;
      goto LABEL_165;
    }
LABEL_168:
    if (!v6) {
      goto LABEL_170;
    }
    goto LABEL_169;
  }
  v105 = self;
  switch(mTilingType)
  {
    case 3:
      id v106 = v7;
      id v107 = v7;
LABEL_165:
      -[TSKCenterTilingButton p_tileHorizCenterOutwardwithLeft:andRight:inRect:](v105, "p_tileHorizCenterOutwardwithLeft:andRight:inRect:", v106, v107, v62, 0.0, v103, v99);
      if (!v6) {
        goto LABEL_170;
      }
LABEL_169:
      [(TSKCenterTilingButton *)self bounds];
      double v109 = v108;
      [v6 size];
      objc_msgSend(v6, "drawAtPoint:", v109 - v110, 0.0);
      goto LABEL_170;
    case 2:
      -[TSKCenterTilingButton p_tileButtedToCapRtoL:inRect:](self, "p_tileButtedToCapRtoL:inRect:", v7, v62, 0.0, v103, v99);
      goto LABEL_168;
    case 1:
      -[TSKCenterTilingButton p_tileButtedToCapLtoR:inRect:](self, "p_tileButtedToCapLtoR:inRect:", v7, v62, 0.0, v103, v99);
      if (!v6) {
        goto LABEL_170;
      }
      goto LABEL_169;
  }
  -[TSKCenterTilingButton p_tileSimple:inRect:](self, "p_tileSimple:inRect:", v7, v62, 0.0, v103, v99);
  if (v6) {
    goto LABEL_169;
  }
LABEL_170:
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  [(TSKCenterTilingButton *)self setBackgroundImage:ImageFromCurrentImageContext forState:a3];
}

- (void)p_tileSimple:(id)a3 inRect:(CGRect)a4
{
  if (a3) {
    objc_msgSend(a3, "drawAsPatternInRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
}

- (void)p_tileButtedToCapLtoR:(id)a3 inRect:(CGRect)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a3)
  {
    CGFloat height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    [a3 size];
    double v10 = v9;
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    rects.origin.double x = x;
    rects.origin.double y = y;
    rects.size.double width = width;
    rects.size.CGFloat height = height;
    CGContextClipToRects(CurrentContext, &rects, 1uLL);
    double v12 = x + width;
    while (x < v12)
    {
      objc_msgSend(a3, "drawAtPoint:", x, y);
      double x = v10 + x;
    }
    CGContextRestoreGState(CurrentContext);
  }
}

- (void)p_tileButtedToCapRtoL:(id)a3 inRect:(CGRect)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3)
  {
    CGFloat height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    [a3 size];
    double v10 = v9;
    [a3 size];
    double v12 = x + width - v11;
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    rects.origin.double x = x;
    rects.origin.double y = y;
    rects.size.double width = width;
    rects.size.CGFloat height = height;
    CGContextClipToRects(CurrentContext, &rects, 1uLL);
    while (1)
    {
      [a3 size];
      if (v12 <= x - v14) {
        break;
      }
      objc_msgSend(a3, "drawAtPoint:", v12, y);
      double v12 = v12 - v10;
    }
    CGContextRestoreGState(CurrentContext);
  }
}

- (void)p_tileHorizCenterOutwardwithLeft:(id)a3 andRight:(id)a4 inRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  [(TSKCenterTilingButton *)self bounds];
  double v13 = round(v12 * 0.5);
  double v14 = v13 - x;
  -[TSKCenterTilingButton p_tileButtedToCapLtoR:inRect:](self, "p_tileButtedToCapLtoR:inRect:", a4, v13, y, x + width - v13, height);

  -[TSKCenterTilingButton p_tileButtedToCapRtoL:inRect:](self, "p_tileButtedToCapRtoL:inRect:", a3, x, y, v14, height);
}

@end