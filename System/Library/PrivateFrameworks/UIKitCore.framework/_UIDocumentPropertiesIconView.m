@interface _UIDocumentPropertiesIconView
- (LPLinkMetadata)metadata;
- (NSDirectionalEdgeInsets)iconInsets;
- (_UIDocumentPropertiesIconView)initWithMetadata:(id)a3;
- (_UIDocumentPropertiesIconView)initWithProperties:(id)a3 metadata:(id)a4;
- (id)_preferredSender;
- (void)_fireTapAction:(id)a3;
- (void)_updateImage;
- (void)setIconInsets:(NSDirectionalEdgeInsets)a3;
- (void)setMetadata:(id)a3;
@end

@implementation _UIDocumentPropertiesIconView

- (_UIDocumentPropertiesIconView)initWithProperties:(id)a3 metadata:(id)a4
{
  v43[4] = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v8 = a4;
  if (!v8)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"UIDocumentProperties.m", 592, @"Invalid parameter not satisfying: %@", @"metadata != nil" object file lineNumber description];
  }
  v37.receiver = self;
  v37.super_class = (Class)_UIDocumentPropertiesIconView;
  v9 = [(UIView *)&v37 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_properties, a3);
    objc_storeStrong((id *)&v10->_metadata, a4);
    v11 = (void *)[objc_alloc((Class)getLPLinkViewClass()) initWithMetadata:v8];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v11 _setDisableTapGesture:1];
    [v11 _setDisableAnimations:1];
    [v11 _setPreferredSizeClass:2];
    objc_msgSend(v11, "setContentInset:", 0.0, 0.0, 0.0, 0.0);
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2050000000;
    v12 = (void *)getLPLinkRendererSizeClassParametersClass_softClass;
    uint64_t v42 = getLPLinkRendererSizeClassParametersClass_softClass;
    if (!getLPLinkRendererSizeClassParametersClass_softClass)
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __getLPLinkRendererSizeClassParametersClass_block_invoke;
      v38[3] = &unk_1E52D9900;
      v38[4] = &v39;
      __getLPLinkRendererSizeClassParametersClass_block_invoke((uint64_t)v38);
      v12 = (void *)v40[3];
    }
    v13 = v12;
    _Block_object_dispose(&v39, 8);
    id v14 = objc_alloc_init(v13);
    [v14 setOnlyShowIcon:1];
    [v14 setPreserveIconAspectRatioAndAlignmentWhenScaling:1];
    [v11 _setSizeClassParameters:v14];
    objc_storeStrong((id *)&v10->_linkView, v11);
    [(UIView *)v10 addSubview:v11];
    v15 = [v11 centerXAnchor];
    v16 = [(UIView *)v10 centerXAnchor];
    uint64_t v17 = [v15 constraintEqualToAnchor:v16];
    centerXInsetConstraint = v10->_centerXInsetConstraint;
    v10->_centerXInsetConstraint = (NSLayoutConstraint *)v17;

    v19 = [v11 trailingAnchor];
    v20 = [(UIView *)v10 trailingAnchor];
    uint64_t v21 = [v19 constraintLessThanOrEqualToAnchor:v20];
    trailingInsetConstraint = v10->_trailingInsetConstraint;
    v10->_trailingInsetConstraint = (NSLayoutConstraint *)v21;

    v23 = [v11 centerYAnchor];
    v24 = [(UIView *)v10 centerYAnchor];
    uint64_t v25 = [v23 constraintEqualToAnchor:v24];
    centerYInsetConstraint = v10->_centerYInsetConstraint;
    v10->_centerYInsetConstraint = (NSLayoutConstraint *)v25;

    v27 = [v11 topAnchor];
    v28 = [(UIView *)v10 topAnchor];
    uint64_t v29 = [v27 constraintGreaterThanOrEqualToAnchor:v28];
    bottomInsetConstraint = v10->_bottomInsetConstraint;
    v10->_bottomInsetConstraint = (NSLayoutConstraint *)v29;

    v31 = (void *)MEMORY[0x1E4F5B268];
    v43[0] = v10->_centerXInsetConstraint;
    v43[1] = v10->_trailingInsetConstraint;
    v43[2] = v10->_centerYInsetConstraint;
    v43[3] = v10->_bottomInsetConstraint;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
    [v31 activateConstraints:v32];

    [(_UIDocumentPropertiesIconView *)v10 _updateImage];
    if (v36)
    {
      v33 = [[UITapGestureRecognizer alloc] initWithTarget:v10 action:sel__fireTapAction_];
      [(UIView *)v10 addGestureRecognizer:v33];
    }
  }

  return v10;
}

- (_UIDocumentPropertiesIconView)initWithMetadata:(id)a3
{
  return [(_UIDocumentPropertiesIconView *)self initWithProperties:0 metadata:a3];
}

- (void)_updateImage
{
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
  [(_UIDocumentPropertiesIconView *)self _updateImage];
}

- (void)setIconInsets:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double top = a3.top;
  self->_iconInsets = a3;
  [(NSLayoutConstraint *)self->_centerXInsetConstraint setConstant:(a3.leading - a3.trailing) * 0.5];
  [(NSLayoutConstraint *)self->_trailingInsetConstraint setConstant:-trailing];
  [(NSLayoutConstraint *)self->_centerYInsetConstraint setConstant:(top - bottom) * 0.5];
  bottomInsetConstraint = self->_bottomInsetConstraint;
  [(NSLayoutConstraint *)bottomInsetConstraint setConstant:-bottom];
}

- (void)_fireTapAction:(id)a3
{
  v4 = [(UIDocumentProperties *)self->_properties iconRepresentationAction];
  if (v4)
  {
    id v5 = v4;
    [v4 performWithSender:self target:0];
    v4 = v5;
  }
}

- (id)_preferredSender
{
  v2 = [(UIView *)self superview];
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 superview];

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (NSDirectionalEdgeInsets)iconInsets
{
  double top = self->_iconInsets.top;
  double leading = self->_iconInsets.leading;
  double bottom = self->_iconInsets.bottom;
  double trailing = self->_iconInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_bottomInsetConstraint, 0);
  objc_storeStrong((id *)&self->_centerYInsetConstraint, 0);
  objc_storeStrong((id *)&self->_trailingInsetConstraint, 0);
  objc_storeStrong((id *)&self->_centerXInsetConstraint, 0);
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end