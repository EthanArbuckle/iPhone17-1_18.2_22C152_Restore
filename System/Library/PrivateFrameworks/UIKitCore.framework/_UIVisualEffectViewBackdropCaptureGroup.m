@interface _UIVisualEffectViewBackdropCaptureGroup
- (BOOL)allowInPlaceFiltering;
- (BOOL)disableInPlaceFiltering;
- (NSString)groupName;
- (NSString)groupNamespace;
- (_UIVisualEffectViewBackdropCaptureGroup)init;
- (_UIVisualEffectViewBackdropCaptureGroup)initWithBackdrop:(id)a3;
- (_UIVisualEffectViewBackdropCaptureGroup)initWithName:(id)a3 scale:(double)a4;
- (double)minimumScale;
- (double)scale;
- (id)description;
- (int64_t)indexOfBackdropView:(id)a3;
- (void)addBackdrop:(id)a3 update:(BOOL)a4;
- (void)applyScaleHint:(double)a3;
- (void)removeBackdrop:(id)a3 update:(BOOL)a4;
- (void)setDisableInPlaceFiltering:(BOOL)a3;
- (void)setGroupName:(id)a3;
- (void)setGroupNamespace:(id)a3;
- (void)setMinimumScale:(double)a3;
- (void)setScale:(double)a3;
- (void)updateAllBackdropViews;
@end

@implementation _UIVisualEffectViewBackdropCaptureGroup

- (_UIVisualEffectViewBackdropCaptureGroup)init
{
  return [(_UIVisualEffectViewBackdropCaptureGroup *)self initWithName:0 scale:1.0];
}

- (BOOL)allowInPlaceFiltering
{
  if (self->_disableInPlaceFiltering || self->_scale < 1.0) {
    return 0;
  }
  if (!self->_groupName) {
    return 1;
  }
  [(NSPointerArray *)self->_backdrops compact];
  return [(NSPointerArray *)self->_backdrops count] < 2;
}

- (void)setGroupName:(id)a3
{
  id v4 = a3;
  v5 = self->_groupName;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

LABEL_9:
    v8 = v11;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    v8 = v11;
    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  v8 = v11;
  if (!v7)
  {
LABEL_8:
    v9 = (NSString *)[(NSString *)v8 copy];
    groupName = self->_groupName;
    self->_groupName = v9;

    [(_UIVisualEffectViewBackdropCaptureGroup *)self updateAllBackdropViews];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)updateAllBackdropViews
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_backdrops;
  uint64_t v4 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        updateBackdropView(*(void **)(*((void *)&v8 + 1) + 8 * v7++), self);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    [(_UIVisualEffectViewBackdropCaptureGroup *)self updateAllBackdropViews];
  }
}

- (void)applyScaleHint:(double)a3
{
  if (a3 > 0.0) {
    -[_UIVisualEffectViewBackdropCaptureGroup setScale:](self, "setScale:");
  }
}

- (void)addBackdrop:(id)a3 update:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (-[_UIVisualEffectViewBackdropCaptureGroup indexOfBackdropView:](self, "indexOfBackdropView:") == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSPointerArray *)self->_backdrops addPointer:v6];
    if (v4) {
      updateBackdropView(v6, self);
    }
  }
}

- (int64_t)indexOfBackdropView:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = self->_backdrops;
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v7 + v8;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v14 + 1) + 8 * v10) == v4)
        {
          int64_t v12 = v8 + v10;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v12;
}

- (void)removeBackdrop:(id)a3 update:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  int64_t v6 = -[_UIVisualEffectViewBackdropCaptureGroup indexOfBackdropView:](self, "indexOfBackdropView:");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSPointerArray *)self->_backdrops removePointerAtIndex:v6];
    if (v4) {
      updateBackdropView(v7, 0);
    }
  }
}

- (NSString)groupName
{
  return self->_groupName;
}

- (_UIVisualEffectViewBackdropCaptureGroup)initWithBackdrop:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 backdropLayer];
  int64_t v6 = [v5 groupName];
  [v5 scale];
  id v7 = -[_UIVisualEffectViewBackdropCaptureGroup initWithName:scale:](self, "initWithName:scale:", v6);

  if (v7) {
    [(NSPointerArray *)v7->_backdrops addPointer:v4];
  }

  return v7;
}

- (_UIVisualEffectViewBackdropCaptureGroup)initWithName:(id)a3 scale:(double)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIVisualEffectViewBackdropCaptureGroup;
  id v7 = [(_UIVisualEffectViewBackdropCaptureGroup *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    backdrops = v7->_backdrops;
    v7->_backdrops = (NSPointerArray *)v8;

    uint64_t v10 = [v6 copy];
    groupName = v7->_groupName;
    v7->_groupName = (NSString *)v10;

    objc_storeStrong((id *)&v7->_groupNamespace, (id)*MEMORY[0x1E4F39DA8]);
    v7->_scale = a4;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupNamespace, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_backdrops, 0);
}

- (void)setDisableInPlaceFiltering:(BOOL)a3
{
  self->_disableInPlaceFiltering = a3;
}

- (void)setMinimumScale:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  double v3 = fmin(a3, 1.0);
  if (self->_minimumScale != v3)
  {
    self->_minimumScale = v3;
    [(_UIVisualEffectViewBackdropCaptureGroup *)self updateAllBackdropViews];
  }
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)_UIVisualEffectViewBackdropCaptureGroup;
  double v3 = [(_UIVisualEffectViewBackdropCaptureGroup *)&v17 description];
  id v4 = (void *)[v3 mutableCopy];

  if (self->_groupName)
  {
    objc_msgSend(v4, "appendFormat:", @" grouped(name='%@'"), self->_groupName;
    if ([(NSString *)self->_groupNamespace isEqualToString:*MEMORY[0x1E4F39DA8]]) {
      [v4 appendString:@""]);
    }
    else {
      [v4 appendFormat:@" in namespace='%@'"], self->_groupNamespace);
    }
  }
  if (self->_scale < 1.0) {
    objc_msgSend(v4, "appendFormat:", @" scale=%f", *(void *)&self->_scale);
  }
  if (self->_minimumScale > 0.0) {
    objc_msgSend(v4, "appendFormat:", @" minimumScale=%f", *(void *)&self->_minimumScale);
  }
  if (self->_disableInPlaceFiltering) {
    [v4 appendString:@" disableInPlaceFiltering"];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_backdrops;
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ((v8 & 1) == 0) {
          [v4 appendString:@" backdrops={"];
        }
        objc_msgSend(v4, "appendFormat:", @" %p", v11);
        char v8 = 1;
      }
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v7);

    [v4 appendString:@" }"];
  }
  else
  {
  }
  return v4;
}

- (NSString)groupNamespace
{
  return self->_groupNamespace;
}

- (void)setGroupNamespace:(id)a3
{
}

- (double)scale
{
  return self->_scale;
}

- (double)minimumScale
{
  return self->_minimumScale;
}

- (BOOL)disableInPlaceFiltering
{
  return self->_disableInPlaceFiltering;
}

@end