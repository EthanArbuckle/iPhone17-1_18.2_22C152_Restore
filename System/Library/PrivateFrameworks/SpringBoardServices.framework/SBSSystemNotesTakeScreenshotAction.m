@interface SBSSystemNotesTakeScreenshotAction
- (BSXPCCodingArray)displaysToScreenshot;
- (SBSSystemNotesTakeScreenshotAction)initWithDisplaysToScreenshot:(id)a3 responder:(id)a4;
@end

@implementation SBSSystemNotesTakeScreenshotAction

- (SBSSystemNotesTakeScreenshotAction)initWithDisplaysToScreenshot:(id)a3 responder:(id)a4
{
  id v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  if (v6)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F4F878]) initWithArray:v6];
    [v9 setObject:v10 forSetting:0];
  }
  v13.receiver = self;
  v13.super_class = (Class)SBSSystemNotesTakeScreenshotAction;
  v11 = [(SBSSystemNotesTakeScreenshotAction *)&v13 initWithInfo:v9 responder:v8];

  return v11;
}

- (BSXPCCodingArray)displaysToScreenshot
{
  v2 = [(SBSSystemNotesTakeScreenshotAction *)self info];
  v3 = [v2 objectForSetting:0];

  return (BSXPCCodingArray *)v3;
}

@end