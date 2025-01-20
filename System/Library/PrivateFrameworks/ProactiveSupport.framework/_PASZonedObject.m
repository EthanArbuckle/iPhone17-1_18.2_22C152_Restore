@interface _PASZonedObject
+ (id)allocWithZone:(_NSZone *)a3;
- (_NSZone)allocationZone;
- (void)dealloc;
@end

@implementation _PASZonedObject

- (_NSZone)allocationZone
{
  v4 = (_NSZone *)MEMORY[0x1A62448C0]();
  if (!v4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_PASZonedObject.m", 42, @"NSZoneFromPointer() unexpectedly returned nil");
  }
  return v4;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  size_t InstanceSize = class_getInstanceSize((Class)a1);
  v6 = NSZoneCalloc(a3, 1uLL, InstanceSize);

  return objc_constructInstance((Class)a1, v6);
}

- (void)dealloc
{
  v4 = (NSZone *)MEMORY[0x1A62448C0]();
  v5 = objc_destructInstance(self);
  if (!v5) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_PASZonedObject.m", 28, @"objc_destructInstance unexpectedly returned nil");
  }

  NSZoneFree(v4, v5);
}

@end