@interface CoreGraphics_TMLModule
+ (BOOL)loadModule;
+ (void)initializeJSContext:(id)a3;
@end

@implementation CoreGraphics_TMLModule

+ (BOOL)loadModule
{
  return 1;
}

+ (void)initializeJSContext:(id)a3
{
  id v12 = a3;
  objc_msgSend_initializeJSContext_(TMLVector, v4, v5, v12);
  objc_msgSend_initializeJSContext_(TMLAffineTransform, v6, v7, v12);
  objc_msgSend_defineConstants_(a1, v8, v9, v12);
  objc_msgSend_setObject_forKeyedSubscript_(v12, v10, v11, &unk_26ECEBF58, @"CGPathCreateCopyByStrokingPath");
}

@end