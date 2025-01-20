@interface _DUIImageComponent
+ (BOOL)supportsSecureCoding;
- ($1AB5FA073B851C12C2339EC22442E995)size3D;
- (BOOL)hidesImage;
- (BOOL)ignoresAccessibilityFilters;
- (BOOL)isEqual:(id)a3;
- (BOOL)representsPortal;
- (CGRect)frame;
- (_DUIImageComponent)initWithCoder:(id)a3;
- (id)createSnapshotViewForPreview:(id)a3;
- (id)description;
- (id)portalView;
- (unint64_t)hash;
- (unint64_t)renderID;
- (unsigned)contextID;
- (unsigned)slotID;
- (void)_configurePortalLayer:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContextID:(unsigned int)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidesImage:(BOOL)a3;
- (void)setIgnoresAccessibilityFilters:(BOOL)a3;
- (void)setRenderID:(unint64_t)a3;
- (void)setSize3D:(id)a3;
- (void)setSlotID:(unsigned int)a3;
@end

@implementation _DUIImageComponent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DUIImageComponent)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_DUIImageComponent;
  v5 = [(_DUIImageComponent *)&v13 init];
  if (v5)
  {
    objc_msgSend(v4, "ui_decodeCAPoint3DForKey:", @"origin");
    v5->_origin.x = v6;
    v5->_origin.y = v7;
    v5->_origin.z = v8;
    [v4 decodeUISize3DForKey:@"size"];
    v5->_size.width = v9;
    v5->_size.height = v10;
    v5->_size.depth = v11;
    v5->_ignoresAccessibilityFilters = [v4 decodeBoolForKey:@"ignoresAccessibilityFilters"];
    v5->_slotID = [v4 decodeInt32ForKey:@"slotID"];
    v5->_renderID = [v4 decodeInt64ForKey:@"renderID"];
    v5->_contextID = [v4 decodeInt32ForKey:@"contextID"];
    v5->_hidesImage = [v4 decodeBoolForKey:@"hidesImage"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double x = self->_origin.x;
  double y = self->_origin.y;
  double z = self->_origin.z;
  id v7 = a3;
  objc_msgSend(v7, "ui_encodeCAPoint3D:forKey:", @"origin", x, y, z);
  objc_msgSend(v7, "encodeUISize3D:forKey:", @"size", self->_size.width, self->_size.height, self->_size.depth);
  [v7 encodeBool:self->_ignoresAccessibilityFilters forKey:@"ignoresAccessibilityFilters"];
  [v7 encodeInt32:self->_slotID forKey:@"slotID"];
  [v7 encodeInt64:self->_renderID forKey:@"renderID"];
  [v7 encodeInt32:self->_contextID forKey:@"contextID"];
  [v7 encodeBool:self->_hidesImage forKey:@"hidesImage"];
}

- (void)setFrame:(CGRect)a3
{
  self->_origin.double x = a3.origin.x;
  self->_origin.double y = a3.origin.y;
  self->_origin.double z = 0.0;
  self->_size.width = a3.size.width;
  self->_size.height = a3.size.height;
  self->_size.depth = 0.0;
}

- (CGRect)frame
{
  double x = self->_origin.x;
  double y = self->_origin.y;
  double width = self->_size.width;
  double height = self->_size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)size3D
{
  double width = self->_size.width;
  double height = self->_size.height;
  double depth = self->_size.depth;
  result.var2 = depth;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (void)setSize3D:(id)a3
{
  self->_size = ($411A14B09BA96096A1FE7E58B287F14F)a3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(_DUIImageComponent *)self slotID];
  unint64_t v6 = [(_DUIImageComponent *)self renderID];
  uint64_t v7 = [(_DUIImageComponent *)self contextID];
  [(_DUIImageComponent *)self frame];
  double v8 = NSStringFromCGRect(v12);
  double v9 = [v3 stringWithFormat:@"<%@ %p: slotID=%u renderID=%llx contextID:%x frame=%@ hidesImage=%d>", v4, self, v5, v6, v7, v8, -[_DUIImageComponent hidesImage](self, "hidesImage")];

  return v9;
}

- (BOOL)representsPortal
{
  return self->_renderID && self->_contextID != 0;
}

- (void)_configurePortalLayer:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setSourceLayerRenderId:", -[_DUIImageComponent renderID](self, "renderID"));
  objc_msgSend(v4, "setSourceContextId:", -[_DUIImageComponent contextID](self, "contextID"));
  [v4 setHidesSourceLayer:1];
  [(_DUIImageComponent *)self frame];
  objc_msgSend(v4, "setFrame:");
}

- (id)portalView
{
  v3 = [_UIPortalView alloc];
  id v4 = -[_UIPortalView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v5 = [(_UIPortalView *)v4 portalLayer];
  [(_DUIImageComponent *)self _configurePortalLayer:v5];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (double *)v4;
    BOOL v8 = CAPoint3DEqualToPoint()
      && (self->_size.width == v5[4] ? (BOOL v6 = self->_size.height == v5[5]) : (BOOL v6 = 0),
          v6 ? (BOOL v7 = self->_size.depth == v5[6]) : (BOOL v7 = 0),
          v7
       && self->_ignoresAccessibilityFilters == *((unsigned __int8 *)v5 + 56)
       && self->_slotID == *((_DWORD *)v5 + 15)
       && self->_renderID == *((void *)v5 + 9)
       && self->_contextID == *((_DWORD *)v5 + 16))
      && self->_hidesImage == *((unsigned __int8 *)v5 + 57);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_renderID ^ self->_slotID ^ self->_contextID;
}

- (id)createSnapshotViewForPreview:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_DUIImageComponent *)self imageComponent];
  BOOL v6 = v5;
  if (v5)
  {
    [v5 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    v15 = [UIView alloc];
    v16 = -[UIView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v12, v14);
    -[UIView setBounds:](v16, "setBounds:", v8, v10, v12, v14);
    if ([v6 representsPortal])
    {
      v17 = [v6 portalView];
      -[_UIDragSlotHostingView setAllowsHitTesting:](v17, "setAllowsHitTesting:", [v4 previewMode] == 4);
    }
    else
    {
      v18 = [_UIDragSlotHostingView alloc];
      [v6 frame];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      [v6 size3D];
      v17 = -[_UIDragSlotHostingView initWithFrame:contentSize:slotID:](v18, "initWithFrame:contentSize:slotID:", [v6 slotID], v20, v22, v24, v26, v27, v28, v29);
    }
    [(UIView *)v16 addSubview:v17];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)ignoresAccessibilityFilters
{
  return self->_ignoresAccessibilityFilters;
}

- (void)setIgnoresAccessibilityFilters:(BOOL)a3
{
  self->_ignoresAccessibilityFilters = a3;
}

- (unsigned)slotID
{
  return self->_slotID;
}

- (void)setSlotID:(unsigned int)a3
{
  self->_slotID = a3;
}

- (unint64_t)renderID
{
  return self->_renderID;
}

- (void)setRenderID:(unint64_t)a3
{
  self->_renderID = a3;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

- (BOOL)hidesImage
{
  return self->_hidesImage;
}

- (void)setHidesImage:(BOOL)a3
{
  self->_hidesImage = a3;
}

@end