@interface _UITintColorVisitor
- (BOOL)_prepareToVisitView:(id)a3 changedSubview:(id)a4 previousWindow:(id)a5 previousSuperview:(id)a6;
- (BOOL)_visitView:(id)a3;
- (_UITintColorVisitor)initWithNotificationReasons:(unint64_t)a3;
- (_UITintColorVisitor)initWithTraversalDirection:(unint64_t)a3;
@end

@implementation _UITintColorVisitor

- (BOOL)_prepareToVisitView:(id)a3 changedSubview:(id)a4 previousWindow:(id)a5 previousSuperview:(id)a6
{
  if ([(_UIViewVisitor *)self tracksHierarchy])
  {
    if ((id)[a4 superview] != a3) {
      return 0;
    }
    if ([a4 _interactionTintColor])
    {
      if (a4)
      {
        if ((*((void *)a4 + 13) & 0x1800000000) != 0 || *((_WORD *)a4 + 104)) {
          return 0;
        }
        uint64_t v13 = [a3 window];
LABEL_12:
        char v14 = 0;
        uint64_t v15 = (*((void *)a4 + 13) >> 44) & 1;
        if (a3) {
          goto LABEL_13;
        }
        goto LABEL_18;
      }
      uint64_t v13 = [a3 window];
    }
    else
    {
      uint64_t v13 = [a3 window];
      if (a4) {
        goto LABEL_12;
      }
    }
    LODWORD(v15) = 0;
    char v14 = 1;
    if (a3)
    {
LABEL_13:
      unint64_t v16 = *((void *)a3 + 13);
      if (v15 != ((v16 >> 44) & 1))
      {
        int v17 = 0;
        if ((v14 & 1) == 0)
        {
          unint64_t v18 = *((void *)a4 + 13);
          uint64_t v19 = (v18 >> 45) & 1;
          unint64_t v20 = 3;
LABEL_40:
          if (v19 != ((v16 >> 45) & 1))
          {
LABEL_50:
            self->_reasons = v20;
            self->_originalVisitedView = (UIView *)a3;
            v12 = &OBJC_IVAR____UITintColorVisitor__changedSubview;
            goto LABEL_5;
          }
          if ((v18 & v16 & 0x200000000000) != 0) {
            goto LABEL_44;
          }
LABEL_42:
          if ((v16 & 0x1800000000) != 0 || *((_WORD *)a3 + 104))
          {
LABEL_44:
            uint64_t v23 = [a6 tintAdjustmentMode];
            uint64_t v24 = [a3 tintAdjustmentMode];
            if (v23 == v24) {
              unint64_t v20 = 1;
            }
            if (!v17 || v23 != v24) {
              goto LABEL_50;
            }
            goto LABEL_48;
          }
LABEL_55:
          if (!v13 || (id)v13 == a5)
          {
            if (!v17)
            {
LABEL_49:
              unint64_t v20 = 1;
              goto LABEL_50;
            }
LABEL_48:
            id v25 = +[UIView _defaultInteractionTintColorForIdiom:](UIView, "_defaultInteractionTintColorForIdiom:", [a6 _userInterfaceIdiom]);
            if (v25 == +[UIView _defaultInteractionTintColorForIdiom:](UIView, "_defaultInteractionTintColorForIdiom:", [a3 _userInterfaceIdiom]))return 0; {
            goto LABEL_49;
            }
          }
LABEL_57:
          if (a5)
          {
            *((void *)&v26 + 1) = *((unsigned int *)a5 + 28);
            *(void *)&long long v26 = *((void *)a5 + 13);
            uint64_t v27 = (v26 >> 35) & 3;
            if (((v26 >> 35) & 3) == 0) {
              uint64_t v27 = 2 * (*((_WORD *)a5 + 104) != 0);
            }
          }
          else
          {
            uint64_t v27 = 0;
          }
          *((void *)&v28 + 1) = *(unsigned int *)(v13 + 112);
          *(void *)&long long v28 = *(void *)(v13 + 104);
          uint64_t v29 = (v28 >> 35) & 3;
          if (((v28 >> 35) & 3) == 0) {
            uint64_t v29 = 2 * (*(_WORD *)(v13 + 208) != 0);
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            char v31 = v17;
          }
          else {
            char v31 = 0;
          }
          if (v30) {
            unint64_t v20 = 1;
          }
          if ((v31 & 1) == 0) {
            goto LABEL_50;
          }
          goto LABEL_48;
        }
        unint64_t v20 = 3;
LABEL_73:
        if ((v16 & 0x200000000000) != 0) {
          goto LABEL_50;
        }
        goto LABEL_42;
      }
LABEL_24:
      if ((v14 & 1) == 0
        && a3
        && (*((void *)a4 + 13) & 0x100000000000) != 0
        && (*((void *)a3 + 13) & 0x100000000000) != 0
        || [a3 _definesTintColor])
      {
        v21 = (void *)[a6 _normalInheritedTintColor];
        if (v21 == (void *)[a3 _normalInheritedTintColor]
          && ([v21 isEqual:v21] & 1) != 0)
        {
          int v17 = 1;
          goto LABEL_51;
        }
      }
      else
      {
        int v17 = 1;
        unint64_t v20 = 2;
        if (!v13 || (id)v13 == a5)
        {
LABEL_37:
          if (v14)
          {
LABEL_52:
            if (!a3) {
              goto LABEL_55;
            }
            unint64_t v16 = *((void *)a3 + 13);
            goto LABEL_73;
          }
LABEL_38:
          unint64_t v18 = *((void *)a4 + 13);
          if (!a3)
          {
            if ((v18 & 0x200000000000) != 0) {
              goto LABEL_50;
            }
            goto LABEL_55;
          }
          uint64_t v19 = (v18 >> 45) & 1;
          unint64_t v16 = *((void *)a3 + 13);
          goto LABEL_40;
        }
        v22 = (void *)[a5 _normalInheritedTintColor];
        if (v22 == (void *)[(id)v13 _normalInheritedTintColor]
          && ![v22 isEqual:v22])
        {
LABEL_51:
          unint64_t v20 = 2;
          if (v14) {
            goto LABEL_52;
          }
          goto LABEL_38;
        }
      }
      int v17 = 0;
      unint64_t v20 = 3;
      goto LABEL_37;
    }
LABEL_18:
    if (v15)
    {
      if ((v14 & 1) == 0 && (*((void *)a4 + 13) & 0x200000000000) != 0)
      {
        unint64_t v20 = 3;
        goto LABEL_50;
      }
      unint64_t v20 = 1;
      if (!v13 || (id)v13 == a5) {
        goto LABEL_50;
      }
      LOBYTE(v17) = 0;
      unint64_t v20 = 3;
      goto LABEL_57;
    }
    goto LABEL_24;
  }
  v12 = &OBJC_IVAR____UITintColorVisitor__originalVisitedView;
  a4 = a3;
LABEL_5:
  *(Class *)((char *)&self->super.super.isa + *v12) = (Class)a4;
  return 1;
}

- (BOOL)_visitView:(id)a3
{
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  BOOL v5 = [(_UIViewVisitor *)self tracksHierarchy];
  uint64_t v6 = [a3 superview];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __34___UITintColorVisitor__visitView___block_invoke;
  v14[3] = &unk_1E5310918;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = v6;
  v14[7] = &v24;
  BOOL v15 = v5;
  v14[8] = &v20;
  v14[9] = &v16;
  if (v5)
  {
    originalVisitedView = self->_originalVisitedView;
    if (originalVisitedView && originalVisitedView == a3)
    {
      v8 = v25;
LABEL_8:
      *((unsigned char *)v8 + 24) = 1;
      goto LABEL_16;
    }
    changedSubview = self->_changedSubview;
    BOOL v11 = changedSubview != a3 || changedSubview == 0;
    if (!v11 || (UIView *)v6 != originalVisitedView) {
      __34___UITintColorVisitor__visitView___block_invoke((uint64_t)v14);
    }
  }
  else
  {
    __34___UITintColorVisitor__visitView___block_invoke((uint64_t)v14);
    v9 = self->_originalVisitedView;
    if (v9 && v9 == a3)
    {
      *((unsigned char *)v25 + 24) = 1;
      v8 = v21;
      goto LABEL_8;
    }
  }
LABEL_16:
  if (*((unsigned char *)v21 + 24)) {
    [a3 _tintColorDidChange];
  }
  if (*((unsigned char *)v17 + 24)) {
    [a3 accessibilityApplyInvertFilter];
  }
  char v12 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v12;
}

- (_UITintColorVisitor)initWithNotificationReasons:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UITintColorVisitor;
  v4 = [(_UIViewVisitor *)&v7 initWithTraversalDirection:2];
  BOOL v5 = v4;
  if (v4)
  {
    v4->_reasons = a3;
    [(_UIViewVisitor *)v4 setVisitMaskViews:0];
  }
  return v5;
}

- (_UITintColorVisitor)initWithTraversalDirection:(unint64_t)a3
{
  return 0;
}

@end