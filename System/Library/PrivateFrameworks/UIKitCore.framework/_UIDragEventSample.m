@interface _UIDragEventSample
+ (id)sampleFromHIDEvent:(__IOHIDEvent *)a3;
- ($BF053CC35471F0BDFB547E2FB1841654)sampleFlags;
- (BOOL)hasBeenDelivered;
- (BOOL)isApplicationEnter;
- (BOOL)isApplicationExit;
- (BOOL)isApplicationWithin;
- (BOOL)isDragEnd;
- (BOOL)isPolicyDriven;
- (CAPoint3D)locationInWindow;
- (CAPoint3D)sceneLocation;
- (UIWindow)window;
- (id)copyWithSampleFlags:(id *)a3;
- (id)description;
- (id)hitTestWithEvent:(id)a3;
- (unsigned)windowServerHitTestContextID;
- (void)setHasBeenDelivered:(BOOL)a3;
@end

@implementation _UIDragEventSample

+ (id)sampleFromHIDEvent:(__IOHIDEvent *)a3
{
  v34[16] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  uint64_t v4 = objc_opt_new();
  v5 = _UIEventHIDUIWindowForHIDEvent();
  objc_storeStrong((id *)(v4 + 24), v5);
  v6 = BKSHIDEventGetBaseAttributes();
  *(_DWORD *)(v4 + 16) = [v6 contextID];

  IOHIDEventGetChildren();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  double v10 = *MEMORY[0x1E4F39B00];
  double v9 = *(double *)(MEMORY[0x1E4F39B00] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F39B00] + 16);
  if (v8)
  {
    uint64_t v12 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v7);
        }
        IOHIDEventGetFloatValue();
        double v15 = v14;
        IOHIDEventGetFloatValue();
        double v17 = v16;
        IOHIDEventGetFloatValue();
        double v10 = v10 + v15;
        double v9 = v9 + v17;
        double v11 = v11 + v18;
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v8);
  }
  unint64_t v19 = [v7 count];

  v20 = -[UIWindow _fbsScene]((id *)v5);
  double v21 = v10 / (double)v19;
  double v22 = v9 / (double)v19;
  *(double *)(v4 + 32) = v21;
  *(double *)(v4 + 40) = v22;
  *(double *)(v4 + 48) = v11 / (double)v19;
  *(double *)(v4 + 56) = _UIConvertScenePoint3DToWindow(v20, v5, v21, v22);
  *(void *)(v4 + 64) = v23;
  *(void *)(v4 + 72) = v24;
  *(unsigned char *)(v4 + 8) = _UIEventHIDIsDragEventLocusType((uint64_t)a3, 2);
  *(unsigned char *)(v4 + 9) = _UIEventHIDIsDragEventLocusType((uint64_t)a3, 1);
  *(unsigned char *)(v4 + 10) = _UIEventHIDIsDragEventLocusType((uint64_t)a3, 3);
  *(unsigned char *)(v4 + 11) = _UIEventHIDIsDragEventLocusType((uint64_t)a3, 4);
  *(void *)&long long v30 = 0;
  *((void *)&v30 + 1) = &v30;
  *(void *)&long long v31 = 0x2020000000;
  BYTE8(v31) = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = ___UIEventHIDAnyChildIsTouching_block_invoke;
  v34[3] = &unk_1E52DA1D8;
  v34[4] = &v30;
  _UIEventHIDEnumerateChildren((uint64_t)a3, 11, v34);
  LOBYTE(v19) = *(unsigned char *)(*((void *)&v30 + 1) + 24);
  _Block_object_dispose(&v30, 8);
  *(unsigned char *)(v4 + 12) = v19 ^ 1;
  if (IOHIDEventGetType() == 11)
  {
    CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
    CFArrayRef v26 = Children;
    if (Children)
    {
      uint64_t Count = CFArrayGetCount(Children);
      if (Count)
      {
        CFIndex v28 = 0;
        while (1)
        {
          CFArrayGetValueAtIndex(v26, v28);
          if (IOHIDEventGetIntegerValue() == 65318 && IOHIDEventGetIntegerValue() == 2) {
            break;
          }
          if (Count == ++v28) {
            goto LABEL_17;
          }
        }
        *(_WORD *)(v4 + 9) = 256;
      }
    }
  }
LABEL_17:

  return (id)v4;
}

- (id)copyWithSampleFlags:(id *)a3
{
  objc_opt_class();
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [(_UIDragEventSample *)self window];
  id v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  long long v8 = *(_OWORD *)&a3->var0.x;
  *(double *)(v5 + 48) = a3->var0.z;
  *(_OWORD *)(v5 + 32) = v8;
  double z = a3->var1.z;
  *(_OWORD *)(v5 + 56) = *(_OWORD *)&a3->var1.x;
  *(double *)(v5 + 72) = z;
  *(unsigned char *)(v5 + 8) = a3->var2;
  *(unsigned char *)(v5 + 9) = a3->var3;
  *(unsigned char *)(v5 + 10) = a3->var4;
  *(unsigned char *)(v5 + 11) = a3->var5;
  *(unsigned char *)(v5 + 12) = a3->var6;
  *(_DWORD *)(v5 + 16) = self->_windowServerHitTestContextID;
  *(unsigned char *)(v5 + 13) = [(_UIDragEventSample *)self hasBeenDelivered];
  return (id)v5;
}

- ($BF053CC35471F0BDFB547E2FB1841654)sampleFlags
{
  *(void *)&retstr->var2 = 0;
  *(_OWORD *)&retstr->var0.double z = 0u;
  *(_OWORD *)&retstr->var1.y = 0u;
  *(_OWORD *)&retstr->var0.x = 0u;
  [(_UIDragEventSample *)self sceneLocation];
  retstr->var0.x = v5;
  retstr->var0.y = v6;
  retstr->var0.double z = v7;
  [(_UIDragEventSample *)self locationInWindow];
  retstr->var1.x = v8;
  retstr->var1.y = v9;
  retstr->var1.double z = v10;
  retstr->var2 = [(_UIDragEventSample *)self isApplicationEnter];
  retstr->var3 = [(_UIDragEventSample *)self isApplicationWithin];
  retstr->var4 = [(_UIDragEventSample *)self isApplicationExit];
  retstr->var5 = [(_UIDragEventSample *)self isPolicyDriven];
  result = ($BF053CC35471F0BDFB547E2FB1841654 *)[(_UIDragEventSample *)self isDragEnd];
  retstr->var6 = (char)result;
  return result;
}

- (id)hitTestWithEvent:(id)a3
{
  id v4 = a3;
  window = self->_window;
  if (window && ![(UIView *)window isHidden])
  {
    double x = self->_sceneLocation.x;
    double y = self->_sceneLocation.y;
    double z = self->_sceneLocation.z;
    if (self->_isPolicyDriven)
    {
      double v10 = self->_window;
      double v11 = -[UIWindow _fbsScene]((id *)&v10->super.super.super.isa);
      double v6 = -[UIWindow _hitTestLocation:sceneLocationZ:inScene:withWindowServerHitTestWindow:event:](v10, "_hitTestLocation:sceneLocationZ:inScene:withWindowServerHitTestWindow:event:", v11, self->_window, v4, x, y, z);
    }
    else
    {
      double v6 = +[UIWindow _globalHitTestForLocation:sceneLocationZ:inWindowServerHitTestWindow:withEvent:](UIWindow, "_globalHitTestForLocation:sceneLocationZ:inWindowServerHitTestWindow:withEvent:", self->_window, v4, self->_sceneLocation.x, self->_sceneLocation.y, self->_sceneLocation.z);
    }
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; isApplicationEnter:%d isApplicationExit:%d isApplicationWithin:%d isDragEnd:%d isPolicyDriven:%d>",
               objc_opt_class(),
               self,
               self->_isApplicationEnter,
               self->_isApplicationExit,
               self->_isApplicationWithin,
               self->_isDragEnd,
               self->_isPolicyDriven);
}

- (UIWindow)window
{
  return self->_window;
}

- (CAPoint3D)sceneLocation
{
  double x = self->_sceneLocation.x;
  double y = self->_sceneLocation.y;
  double z = self->_sceneLocation.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CAPoint3D)locationInWindow
{
  double x = self->_locationInWindow.x;
  double y = self->_locationInWindow.y;
  double z = self->_locationInWindow.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isApplicationEnter
{
  return self->_isApplicationEnter;
}

- (BOOL)isApplicationWithin
{
  return self->_isApplicationWithin;
}

- (BOOL)isApplicationExit
{
  return self->_isApplicationExit;
}

- (BOOL)isPolicyDriven
{
  return self->_isPolicyDriven;
}

- (BOOL)isDragEnd
{
  return self->_isDragEnd;
}

- (unsigned)windowServerHitTestContextID
{
  return self->_windowServerHitTestContextID;
}

- (BOOL)hasBeenDelivered
{
  return self->_hasBeenDelivered;
}

- (void)setHasBeenDelivered:(BOOL)a3
{
  self->_hasBeenDelivered = a3;
}

- (void).cxx_destruct
{
}

@end