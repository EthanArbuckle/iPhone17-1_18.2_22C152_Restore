@interface PRUISPosterSnapshotRequest
+ (id)snapshotRequestForPRPosterConfiguration:(id)a3 definition:(id)a4 interfaceOrientation:(int64_t)a5;
+ (id)snapshotRequestForPRSPosterConfiguration:(id)a3 definition:(id)a4 interfaceOrientation:(int64_t)a5;
+ (id)snapshotRequestForPoster:(id)a3 definition:(id)a4 interfaceOrientation:(int64_t)a5;
- (BOOL)determineColorStatistics;
- (BOOL)isEqual:(id)a3;
- (NSArray)attachments;
- (PRPosterContents)poster;
- (PRPosterSnapshotDefinition)definition;
- (PRUISPosterAttachmentConfiguration)attachmentConfiguration;
- (PRUISPosterSnapshotRequest)initWithPoster:(id)a3 definition:(id)a4 interfaceOrientation:(int64_t)a5;
- (UIScreen)screen;
- (double)timeout;
- (id)buildPosterKitSnapshotRequestForOutput:(unint64_t)a3 priority:(int64_t)a4 sceneAttachments:(id)a5 error:(id *)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)serverPosterPath;
- (int64_t)interfaceOrientation;
- (int64_t)userInterfaceStyle;
- (unint64_t)hash;
- (unint64_t)priority;
- (void)dealloc;
- (void)setAttachmentConfiguration:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setDefinition:(id)a3;
- (void)setDetermineColorStatistics:(BOOL)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setScreen:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation PRUISPosterSnapshotRequest

+ (id)snapshotRequestForPRPosterConfiguration:(id)a3 definition:(id)a4 interfaceOrientation:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithPoster:v9 definition:v8 interfaceOrientation:a5];

  return v10;
}

+ (id)snapshotRequestForPRSPosterConfiguration:(id)a3 definition:(id)a4 interfaceOrientation:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = v9;
    id v11 = objc_alloc((Class)a1);
    id v12 = objc_alloc(MEMORY[0x263F5F4D8]);
    v13 = [v8 _path];
    v14 = (void *)[v12 _initWithPath:v13];
    v15 = (void *)[v11 initWithPoster:v14 definition:v10 interfaceOrientation:a5];

    return v15;
  }
  else
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"poster"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[PRUISPosterSnapshotRequest snapshotRequestForPRSPosterConfiguration:definition:interfaceOrientation:]();
    }
    [v17 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)snapshotRequestForPoster:(id)a3 definition:(id)a4 interfaceOrientation:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithPoster:v9 definition:v8 interfaceOrientation:a5];

  return v10;
}

- (PRUISPosterSnapshotRequest)initWithPoster:(id)a3 definition:(id)a4 interfaceOrientation:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [v9 _path];
  char v12 = [v11 isServerPosterPath];

  if ((v12 & 1) == 0)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[(id <PRPosterContentsInternal>)poster _path] isServerPosterPath]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterSnapshotRequest initWithPoster:definition:interfaceOrientation:]();
    }
LABEL_17:
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A05CA68);
  }
  if (!v10)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"definition"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterSnapshotRequest initWithPoster:definition:interfaceOrientation:]();
    }
    goto LABEL_17;
  }
  v26.receiver = self;
  v26.super_class = (Class)PRUISPosterSnapshotRequest;
  v13 = [(PRUISPosterSnapshotRequest *)&v26 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_poster, a3);
    v15 = [v9 _path];
    uint64_t v16 = [v15 extendValidityForReason:@"Snapshot Request"];
    sandboxExtension = v14->_sandboxExtension;
    v14->_sandboxExtension = (BSInvalidatable *)v16;

    v14->_determineColorStatistics = 0;
    objc_storeStrong((id *)&v14->_definition, a4);
    if (BSInterfaceOrientationIsValid()) {
      int64_t v18 = a5;
    }
    else {
      int64_t v18 = 1;
    }
    v14->_interfaceOrientation = v18;
    uint64_t v19 = [MEMORY[0x263F1C920] mainScreen];
    screen = v14->_screen;
    v14->_screen = (UIScreen *)v19;

    v14->_timeout = 120.0;
    v14->_priority = 0;
    v21 = [v9 role];
    int v22 = [v21 isEqualToString:*MEMORY[0x263F5F568]];

    if (v22)
    {
      v14->_userInterfaceStyle = 2;
    }
    else
    {
      v23 = [(UIScreen *)v14->_screen traitCollection];
      v14->_userInterfaceStyle = [v23 userInterfaceStyle];
    }
  }

  return v14;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_sandboxExtension invalidate];
  sandboxExtension = self->_sandboxExtension;
  self->_sandboxExtension = 0;

  v4.receiver = self;
  v4.super_class = (Class)PRUISPosterSnapshotRequest;
  [(PRUISPosterSnapshotRequest *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = [+[PRUISPosterSnapshotRequest allocWithZone:a3] initWithPoster:self->_poster definition:self->_definition interfaceOrientation:self->_interfaceOrientation];
  uint64_t v5 = [(PRUISPosterSnapshotRequest *)self screen];
  screen = v4->_screen;
  v4->_screen = (UIScreen *)v5;

  v4->_timeout = self->_timeout;
  v4->_priority = self->_priority;
  v4->_userInterfaceStyle = self->_userInterfaceStyle;
  v4->_determineColorStatistics = self->_determineColorStatistics;
  objc_storeStrong((id *)&v4->_attachmentConfiguration, self->_attachmentConfiguration);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_super v4 = [(PRUISPosterSnapshotRequest *)+[PRUISMutablePosterSnapshotRequest allocWithZone:a3] initWithPoster:self->_poster definition:self->_definition interfaceOrientation:self->_interfaceOrientation];
  uint64_t v5 = [(PRUISPosterSnapshotRequest *)self screen];
  [(PRUISPosterSnapshotRequest *)v4 setScreen:v5];

  [(PRUISPosterSnapshotRequest *)v4 setTimeout:self->_timeout];
  [(PRUISPosterSnapshotRequest *)v4 setPriority:self->_priority];
  [(PRUISPosterSnapshotRequest *)v4 setUserInterfaceStyle:self->_userInterfaceStyle];
  [(PRUISPosterSnapshotRequest *)v4 setDetermineColorStatistics:self->_determineColorStatistics];
  [(PRUISPosterSnapshotRequest *)v4 setAttachmentConfiguration:self->_attachmentConfiguration];
  return v4;
}

- (void)setScreen:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x263F1C920] mainScreen];
  }
  screen = self->_screen;
  p_screen = &self->_screen;
  id obj = v4;
  if (([(UIScreen *)screen isEqual:v4] & 1) == 0) {
    objc_storeStrong((id *)p_screen, obj);
  }
}

- (UIScreen)screen
{
  screen = self->_screen;
  if (!screen)
  {
    id v4 = [MEMORY[0x263F1C920] mainScreen];
    uint64_t v5 = self->_screen;
    self->_screen = v4;

    screen = self->_screen;
  }

  return screen;
}

- (void)setAttachments:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [(PRUISPosterSnapshotRequest *)self attachmentConfiguration];
    v6 = [v5 attachmentHostWindowScene];
    if (v6) {
      goto LABEL_8;
    }
    v7 = [(PRUISPosterSnapshotRequest *)self screen];
    id v8 = v7;
    if (!v7)
    {
      id v8 = [MEMORY[0x263F1C920] mainScreen];
    }
    v6 = _findUIWindowSceneForUIScreen(v8);
    if (!v7) {

    }
    if (v6)
    {
LABEL_8:
      id v9 = +[PRUISPosterAttachmentConfiguration attachmentConfigurationWithHostWindowScene:v6 attachments:v4];
      [(PRUISPosterSnapshotRequest *)self setAttachmentConfiguration:v9];
    }
    else
    {
      id v10 = PRUISLogAttachments();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[PRUISPosterSnapshotRequest setAttachments:](v10);
      }

      [(PRUISPosterSnapshotRequest *)self setAttachmentConfiguration:0];
    }
  }
  else
  {
    [(PRUISPosterSnapshotRequest *)self setAttachmentConfiguration:0];
  }
}

- (NSArray)attachments
{
  v2 = [(PRUISPosterSnapshotRequest *)self attachmentConfiguration];
  v3 = [v2 attachments];

  return (NSArray *)v3;
}

- (void)setAttachmentConfiguration:(id)a3
{
  id v11 = (PRUISPosterAttachmentConfiguration *)a3;
  if ([(PRUISPosterAttachmentConfiguration *)self->_attachmentConfiguration isEqual:v11])
  {
LABEL_6:
    goto _objc_release_x1;
  }
  id v4 = v11;
  if (!v11)
  {
LABEL_5:
    attachmentConfiguration = self->_attachmentConfiguration;
    self->_attachmentConfiguration = v4;

    goto LABEL_6;
  }
  uint64_t v5 = [(PRUISPosterAttachmentConfiguration *)v11 attachmentHostWindowScene];
  v6 = [v5 screen];
  v7 = [(PRUISPosterSnapshotRequest *)self screen];
  char v8 = [v6 isEqual:v7];

  if (v8)
  {
    id v4 = v11;
    goto LABEL_5;
  }
  id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[[attachmentConfiguration attachmentHostWindowScene] screen] isEqual:[self screen]]"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[PRUISPosterSnapshotRequest setAttachmentConfiguration:]();
  }
  [v10 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
_objc_release_x1:
  MEMORY[0x270F9A758]();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F29C58] builderWithObject:self ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __38__PRUISPosterSnapshotRequest_isEqual___block_invoke;
  v34[3] = &unk_26546BCE0;
  v34[4] = self;
  id v7 = v6;
  id v35 = v7;
  id v8 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v34, 0);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_2;
  v32[3] = &unk_26546BCE0;
  v32[4] = self;
  id v9 = v7;
  id v33 = v9;
  id v10 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v32, 0);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_3;
  v30[3] = &unk_26546BCE0;
  v30[4] = self;
  id v11 = v9;
  id v31 = v11;
  id v12 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v30, 0);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_4;
  v28[3] = &unk_26546BCE0;
  v28[4] = self;
  id v13 = v11;
  id v29 = v13;
  id v14 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v28, 0);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_5;
  v26[3] = &unk_26546BCE0;
  v26[4] = self;
  id v15 = v13;
  id v27 = v15;
  id v16 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v26, 0);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_6;
  v24[3] = &unk_26546BCE0;
  v24[4] = self;
  id v17 = v15;
  id v25 = v17;
  id v18 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v24, 0);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_7;
  v22[3] = &unk_26546BCE0;
  v22[4] = self;
  id v23 = v17;
  id v19 = v17;
  id v20 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v22, 0);
  LOBYTE(v17) = [v5 isEqual:v19];

  return (char)v17;
}

uint64_t __38__PRUISPosterSnapshotRequest_isEqual___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) serverPosterPath];
  v3 = [*(id *)(a1 + 40) serverPosterPath];
  unsigned int v4 = BSEqualObjects();
  if (v2) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (v3) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_2()
{
  return BSEqualObjects();
}

BOOL __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_3(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 48) == *(void *)(*(void *)(a1 + 40) + 48);
}

uint64_t __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) screen];
  v3 = [*(id *)(a1 + 40) screen];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

BOOL __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_5(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 56) == *(void *)(*(void *)(a1 + 40) + 56);
}

uint64_t __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) isEqual:*(void *)(*(void *)(a1 + 40) + 80)];
}

BOOL __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_7(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 16) == *(unsigned __int8 *)(*(void *)(a1 + 40) + 16);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  uint64_t v4 = [(PRUISPosterSnapshotRequest *)self poster];
  id v5 = (id)[v3 appendObject:v4];

  uint64_t v6 = [(PRUISPosterSnapshotRequest *)self definition];
  id v7 = (id)[v3 appendObject:v6];

  id v8 = [(PRUISPosterSnapshotRequest *)self screen];
  id v9 = (id)[v3 appendObject:v8];

  id v10 = [(PRUISPosterSnapshotRequest *)self attachmentConfiguration];
  id v11 = (id)[v3 appendObject:v10];

  id v12 = (id)objc_msgSend(v3, "appendInteger:", -[PRUISPosterSnapshotRequest userInterfaceStyle](self, "userInterfaceStyle"));
  id v13 = (id)objc_msgSend(v3, "appendInteger:", -[PRUISPosterSnapshotRequest interfaceOrientation](self, "interfaceOrientation"));
  id v14 = (id)objc_msgSend(v3, "appendBool:", -[PRUISPosterSnapshotRequest determineColorStatistics](self, "determineColorStatistics"));
  id v15 = (id)objc_msgSend(v3, "appendInt64:", -[PRUISPosterSnapshotRequest priority](self, "priority"));
  unint64_t v16 = [v3 hash];

  return v16;
}

- (id)description
{
  objc_initWeak(&location, self);
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  uint64_t v4 = [(PRUISPosterSnapshotRequest *)self poster];
  id v5 = (id)[v3 appendObject:v4 withName:@"poster"];

  uint64_t v6 = [(PRUISPosterSnapshotRequest *)self definition];
  id v7 = (id)[v3 appendObject:v6 withName:@"definition"];

  id v8 = [(PRUISPosterSnapshotRequest *)self screen];
  id v9 = (id)[v3 appendObject:v8 withName:@"screen"];

  id v10 = [(PRUISPosterSnapshotRequest *)self attachmentConfiguration];
  id v11 = (id)[v3 appendObject:v10 withName:@"attachmentConfiguration" skipIfNil:1];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __41__PRUISPosterSnapshotRequest_description__block_invoke;
  v20[3] = &unk_26546BD08;
  objc_copyWeak(&v21, &location);
  id v12 = __41__PRUISPosterSnapshotRequest_description__block_invoke((uint64_t)v20);
  id v13 = (id)[v3 appendObject:v12 withName:@"interfaceOrientation"];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __41__PRUISPosterSnapshotRequest_description__block_invoke_2;
  v18[3] = &unk_26546BD08;
  objc_copyWeak(&v19, &location);
  id v14 = __41__PRUISPosterSnapshotRequest_description__block_invoke_2((uint64_t)v18);
  id v15 = (id)[v3 appendObject:v14 withName:@"userInterfaceStyle"];

  unint64_t v16 = [v3 build];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);

  return v16;
}

__CFString *__41__PRUISPosterSnapshotRequest_description__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained interfaceOrientation];

  if ((unint64_t)(v2 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_26546BD70[v2 - 1];
  }
}

__CFString *__41__PRUISPosterSnapshotRequest_description__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained userInterfaceStyle];

  v3 = @"Unspecified";
  if (v2 == 1) {
    v3 = @"Light";
  }
  if (v2 == 2) {
    return @"Dark";
  }
  else {
    return v3;
  }
}

- (id)serverPosterPath
{
  uint64_t v2 = [(PRUISPosterSnapshotRequest *)self poster];
  v3 = [v2 _path];

  return v3;
}

- (id)buildPosterKitSnapshotRequestForOutput:(unint64_t)a3 priority:(int64_t)a4 sceneAttachments:(id)a5 error:(id *)a6
{
  v56[1] = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = [(PRUISPosterSnapshotRequest *)self serverPosterPath];
  if (([v11 isServerPosterPath] & 1) == 0)
  {
    v42 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[path isServerPosterPath]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterSnapshotRequest buildPosterKitSnapshotRequestForOutput:priority:sceneAttachments:error:]();
    }
    [v42 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A05DE74);
  }
  id v12 = [(PRUISPosterSnapshotRequest *)self definition];
  id v13 = [MEMORY[0x263F5F4F8] modelObjectCacheForPath:v11];
  uint64_t v14 = [v13 configuredProperties];
  if (!v14)
  {
    id v54 = 0;
    uint64_t v15 = [MEMORY[0x263F5F500] loadConfiguredPropertiesForPath:v11 error:&v54];
    id v16 = v54;

    if (v15)
    {
      int64_t v43 = a4;
      goto LABEL_6;
    }
    if (v16)
    {
      if (a6)
      {
LABEL_23:
        id v16 = v16;
        v38 = 0;
        *a6 = v16;
        goto LABEL_18;
      }
    }
    else
    {
      v40 = (void *)MEMORY[0x263F087E8];
      uint64_t v55 = *MEMORY[0x263F08338];
      v56[0] = @"Unable to load configured properties for path.";
      v41 = [NSDictionary dictionaryWithObjects:v56 forKeys:&v55 count:1];
      id v16 = [v40 errorWithDomain:@"com.apple.PosterBoardUIServices.errorDomain" code:-1 userInfo:v41];

      if (a6) {
        goto LABEL_23;
      }
    }
    v38 = 0;
    goto LABEL_18;
  }
  uint64_t v15 = v14;
  int64_t v43 = a4;

  id v16 = 0;
LABEL_6:
  id v17 = objc_alloc_init(MEMORY[0x263F5F508]);
  objc_msgSend(v17, "setSnapshotOptions:", objc_msgSend(MEMORY[0x263F5F518], "snapshotOptionsForDefinition:", v12));
  id v18 = objc_msgSend(MEMORY[0x263F1CB00], "traitCollectionWithUserInterfaceStyle:", -[PRUISPosterSnapshotRequest userInterfaceStyle](self, "userInterfaceStyle"));
  [v17 setTraitCollection:v18];

  id v19 = (void *)MEMORY[0x263F3F468];
  id v20 = [(PRUISPosterSnapshotRequest *)self screen];
  uint64_t v21 = objc_msgSend(v19, "pui_displayConfigurationForScreen:", v20);

  v44 = (void *)v21;
  [v17 setDisplayConfiguration:v21];
  int64_t v22 = [(PRUISPosterSnapshotRequest *)self interfaceOrientation];
  unint64_t v46 = a3;
  id v47 = v16;
  if (v22)
  {
    int64_t v23 = v22;
    if (MEMORY[0x25A2F3EF0]()) {
      uint64_t v24 = 1;
    }
    else {
      uint64_t v24 = v23;
    }
  }
  else
  {
    id v25 = [v11 role];
    int v26 = [v25 isEqualToString:*MEMORY[0x263F5F568]];

    if (v26) {
      uint64_t v24 = 4;
    }
    else {
      uint64_t v24 = 1;
    }
    int64_t v23 = v24;
  }
  [v17 setInterfaceOrientation:v24];
  [v17 setDeviceOrientation:v23];
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __101__PRUISPosterSnapshotRequest_buildPosterKitSnapshotRequestForOutput_priority_sceneAttachments_error___block_invoke;
  v51[3] = &unk_26546BD30;
  v48 = v12;
  id v27 = v12;
  id v52 = v27;
  id v28 = v10;
  id v53 = v28;
  [v17 applySceneSettings:v51];
  id v29 = [v11 serverIdentity];
  v30 = [v29 provider];

  v49 = v11;
  v45 = (void *)v15;
  id v31 = [v17 buildWithPath:v11 provider:v30 configuredProperties:v15 snapshotDefinition:v27];
  v32 = [MEMORY[0x263F3F498] settings];
  [v31 applyToMutableSceneSettings:v32];
  id v33 = [v27 levelSets];
  v34 = objc_msgSend(v33, "bs_mapNoNulls:", &__block_literal_global_14);

  id v50 = v10;
  if ([(PRUISPosterSnapshotRequest *)self determineColorStatistics])
  {
    id v35 = [MEMORY[0x263F5F5C0] defaultLegibilityProcessingRequest];
  }
  else
  {
    id v35 = 0;
  }
  id v36 = objc_alloc(MEMORY[0x263F5F5C8]);
  v37 = [v27 uniqueIdentifier];
  [(PRUISPosterSnapshotRequest *)self timeout];
  v38 = objc_msgSend(v36, "initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:", v49, v37, v32, v46, v43, v34, v35, v28);

  id v11 = v49;
  id v10 = v50;
  id v16 = v47;
  id v12 = v48;
LABEL_18:

  return v38;
}

void __101__PRUISPosterSnapshotRequest_buildPosterKitSnapshotRequestForOutput_priority_sceneAttachments_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "pui_setPosterBoundingShape:", objc_msgSend(*(id *)(a1 + 32), "boundingShape"));
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v3, "pui_setSceneAttachments:");
  }
}

id __101__PRUISPosterSnapshotRequest_buildPosterKitSnapshotRequestForOutput_priority_sceneAttachments_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x263F5F590];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 levels];

  uint64_t v6 = (void *)[v4 initWithSet:v5];

  return v6;
}

- (PRPosterContents)poster
{
  return self->_poster;
}

- (PRPosterSnapshotDefinition)definition
{
  return self->_definition;
}

- (void)setDefinition:(id)a3
{
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (PRUISPosterAttachmentConfiguration)attachmentConfiguration
{
  return self->_attachmentConfiguration;
}

- (BOOL)determineColorStatistics
{
  return self->_determineColorStatistics;
}

- (void)setDetermineColorStatistics:(BOOL)a3
{
  self->_determineColorStatistics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentConfiguration, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_poster, 0);
  objc_storeStrong((id *)&self->_screen, 0);

  objc_storeStrong((id *)&self->_sandboxExtension, 0);
}

+ (void)snapshotRequestForPRSPosterConfiguration:definition:interfaceOrientation:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPoster:definition:interfaceOrientation:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPoster:definition:interfaceOrientation:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setAttachments:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)SEL v1 = 0;
  _os_log_fault_impl(&dword_25A03F000, log, OS_LOG_TYPE_FAULT, "Failed to resolve a window scene for attachments.", v1, 2u);
}

- (void)setAttachmentConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)buildPosterKitSnapshotRequestForOutput:priority:sceneAttachments:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end