@interface UISPasteVariant
+ (id)_systemAssetCatalog;
- (id)_keyCommandSpecification;
@end

@implementation UISPasteVariant

- (id)_keyCommandSpecification
{
  v3 = [(UISPasteVariant *)self keyInput];
  if (v3)
  {
    unsigned int v4 = [(UISPasteVariant *)self secureName];
    unint64_t v5 = 0xF317E322CB2CEA02;
    if (v4 != 65537) {
      unint64_t v5 = 0;
    }
    if (v4 == 0x10000) {
      unint64_t v6 = 0x84E6A8CBF3F0F10CLL;
    }
    else {
      unint64_t v6 = v5;
    }
    v7 = +[BKSHIDEventKeyCommand keyCommandWithInput:v3 modifierFlags:[(UISPasteVariant *)self keyModifierFlags]];
    v8 = +[BKSHIDAuthenticatedKeyCommandSpecification specificationWithKeyCommand:v7 context:v6];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_systemAssetCatalog
{
  off_1000394C0();
  v3 = *v2;
  if (*v2) {
    goto LABEL_4;
  }
  unsigned int v4 = v2;
  id v5 = objc_alloc((Class)CUICatalog);
  unint64_t v6 = +[NSURL fileURLWithPath:@"/System/Library/CoreServices/CoreGlyphs.bundle/Assets.car"];
  id v12 = 0;
  id v7 = [v5 initWithURL:v6 error:&v12];
  id v8 = v12;

  if (v7)
  {
    *unsigned int v4 = v7;

    v3 = *v4;
LABEL_4:
    id v9 = v3;
    goto LABEL_5;
  }
  v11 = _PBLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Could not load system asset catalog. Error: %@", buf, 0xCu);
  }

  id v9 = 0;
LABEL_5:
  return v9;
}

@end