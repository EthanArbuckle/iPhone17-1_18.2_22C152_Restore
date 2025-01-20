@interface SBDisplayPowerLogEntry
+ (id)forDisplay:(id)a3 mode:(unint64_t)a4 zoom:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (CGSize)canvasSize;
- (CGSize)nativeSize;
- (NSString)displayName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)logPayload;
- (unint64_t)hash;
- (unint64_t)windowingMode;
- (unint64_t)zoomLevel;
- (void)setCanvasSize:(CGSize)a3;
- (void)setDisplayName:(id)a3;
- (void)setNativeSize:(CGSize)a3;
- (void)setWindowingMode:(unint64_t)a3;
- (void)setZoomLevel:(unint64_t)a3;
@end

@implementation SBDisplayPowerLogEntry

+ (id)forDisplay:(id)a3 mode:(unint64_t)a4 zoom:(unint64_t)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v9 = [a3 CADisplay];
  v10 = v9;
  if (!v9)
  {
    v22 = SBLogDisplayControlling();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      +[SBDisplayPowerLogEntry forDisplay:mode:zoom:]((uint64_t)a1, (uint64_t)a2, v22);
    }
    goto LABEL_6;
  }
  v11 = [v9 name];

  v12 = [v10 name];
  v13 = v12;
  if (v11)
  {
    [v10 bounds];
    double v15 = v14;
    double v17 = v16;
    [v10 nativeSize];
    double v19 = v18;
    double v21 = v20;
    goto LABEL_9;
  }

  if (!v13)
  {
    v22 = SBLogDisplayControlling();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      v25 = _SBFLoggingMethodProem();
      int v26 = 138543618;
      v27 = v25;
      __int16 v28 = 2114;
      v29 = v10;
      _os_log_fault_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_FAULT, "%{public}@ we received a CADisplay with a nil name. garbage in garbage out. caDisplay: %{public}@", (uint8_t *)&v26, 0x16u);
    }
LABEL_6:
  }
  double v19 = *MEMORY[0x1E4F1DB30];
  double v21 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v13 = @"<Invalid>";
  double v17 = v21;
  double v15 = *MEMORY[0x1E4F1DB30];
LABEL_9:
  v23 = objc_alloc_init(SBDisplayPowerLogEntry);
  [(SBDisplayPowerLogEntry *)v23 setDisplayName:v13];
  -[SBDisplayPowerLogEntry setCanvasSize:](v23, "setCanvasSize:", v15, v17);
  -[SBDisplayPowerLogEntry setNativeSize:](v23, "setNativeSize:", v19, v21);
  [(SBDisplayPowerLogEntry *)v23 setWindowingMode:a4];
  [(SBDisplayPowerLogEntry *)v23 setZoomLevel:a5];

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SBDisplayPowerLogEntry);
  [(SBDisplayPowerLogEntry *)v4 setDisplayName:self->_displayName];
  -[SBDisplayPowerLogEntry setCanvasSize:](v4, "setCanvasSize:", self->_canvasSize.width, self->_canvasSize.height);
  -[SBDisplayPowerLogEntry setNativeSize:](v4, "setNativeSize:", self->_nativeSize.width, self->_nativeSize.height);
  [(SBDisplayPowerLogEntry *)v4 setWindowingMode:self->_windowingMode];
  [(SBDisplayPowerLogEntry *)v4 setZoomLevel:self->_zoomLevel];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBDisplayPowerLogEntry *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v8 = [(NSString *)self->_displayName isEqualToString:v5->_displayName]
        && (self->_canvasSize.width == v5->_canvasSize.width
          ? (BOOL v6 = self->_canvasSize.height == v5->_canvasSize.height)
          : (BOOL v6 = 0),
            v6
         && (self->_nativeSize.width == v5->_nativeSize.width
           ? (BOOL v7 = self->_nativeSize.height == v5->_nativeSize.height)
           : (BOOL v7 = 0),
             v7 && self->_windowingMode == v5->_windowingMode))
        && self->_zoomLevel == v5->_zoomLevel;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendString:self->_displayName];
  id v5 = (id)objc_msgSend(v3, "appendCGSize:", self->_canvasSize.width, self->_canvasSize.height);
  id v6 = (id)objc_msgSend(v3, "appendCGSize:", self->_nativeSize.width, self->_nativeSize.height);
  id v7 = (id)[v3 appendUnsignedInteger:self->_windowingMode];
  id v8 = (id)[v3 appendUnsignedInteger:self->_zoomLevel];
  unint64_t v9 = [v3 hash];

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_displayName withName:@"displayName"];
  id v4 = (id)objc_msgSend(v3, "appendSize:withName:", @"canvasSize", self->_canvasSize.width, self->_canvasSize.height);
  id v5 = (id)objc_msgSend(v3, "appendSize:withName:", @"nativeSize", self->_nativeSize.width, self->_nativeSize.height);
  unint64_t v6 = self->_windowingMode - 1;
  if (v6 > 4) {
    id v7 = @"Invalid";
  }
  else {
    id v7 = off_1E6B0A618[v6];
  }
  [v3 appendString:v7 withName:@"windowingMode"];
  unint64_t v8 = self->_zoomLevel - 1;
  if (v8 > 3) {
    unint64_t v9 = @"Invalid";
  }
  else {
    unint64_t v9 = off_1E6B0A640[v8];
  }
  [v3 appendString:v9 withName:@"zoomLevel"];
  v10 = [v3 build];

  return v10;
}

- (id)logPayload
{
  v14[7] = *MEMORY[0x1E4F143B8];
  v14[0] = self->_displayName;
  v13[0] = @"displayName";
  v13[1] = @"canvasSizeWidth";
  v3 = [NSNumber numberWithDouble:self->_canvasSize.width];
  v14[1] = v3;
  v13[2] = @"canvasSizeHeight";
  id v4 = [NSNumber numberWithDouble:self->_canvasSize.height];
  v14[2] = v4;
  v13[3] = @"nativeSizeWidth";
  id v5 = [NSNumber numberWithDouble:self->_nativeSize.width];
  v14[3] = v5;
  v13[4] = @"nativeSizeHeight";
  unint64_t v6 = [NSNumber numberWithDouble:self->_nativeSize.height];
  v14[4] = v6;
  v13[5] = @"windowingMode";
  unint64_t v7 = self->_windowingMode - 1;
  if (v7 > 4) {
    unint64_t v8 = @"Invalid";
  }
  else {
    unint64_t v8 = off_1E6B0A618[v7];
  }
  v14[5] = v8;
  v13[6] = @"zoomLevel";
  unint64_t v9 = self->_zoomLevel - 1;
  if (v9 > 3) {
    v10 = @"Invalid";
  }
  else {
    v10 = off_1E6B0A640[v9];
  }
  v14[6] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:7];

  return v11;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (unint64_t)windowingMode
{
  return self->_windowingMode;
}

- (void)setWindowingMode:(unint64_t)a3
{
  self->_windowingMode = a3;
}

- (unint64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(unint64_t)a3
{
  self->_zoomLevel = a3;
}

- (CGSize)canvasSize
{
  double width = self->_canvasSize.width;
  double height = self->_canvasSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->_canvasSize = a3;
}

- (CGSize)nativeSize
{
  double width = self->_nativeSize.width;
  double height = self->_nativeSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNativeSize:(CGSize)a3
{
  self->_nativeSize = a3;
}

- (void).cxx_destruct
{
}

+ (void)forDisplay:(uint64_t)a1 mode:(uint64_t)a2 zoom:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = _SBFLoggingMethodProem();
  int v5 = 138543362;
  unint64_t v6 = v4;
  _os_log_fault_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_FAULT, "%{public}@ we received a nil CADisplay. garbage in garbage out", (uint8_t *)&v5, 0xCu);
}

@end