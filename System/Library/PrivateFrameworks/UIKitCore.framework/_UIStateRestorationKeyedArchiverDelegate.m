@interface _UIStateRestorationKeyedArchiverDelegate
+ (id)sharedDelegate;
- (id)archiver:(id)a3 willEncodeObject:(id)a4;
@end

@implementation _UIStateRestorationKeyedArchiverDelegate

+ (id)sharedDelegate
{
  if (qword_1EB262DA8 != -1) {
    dispatch_once(&qword_1EB262DA8, &__block_literal_global_474);
  }
  return (id)qword_1EB262DB0;
}

- (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  id v4 = a4;
  if ((objc_msgSend(a4, "__isKindOfUIResponder", a3) & 1) != 0
    || [v4 conformsToProtocol:&unk_1ED7013C0])
  {
    if (_UIStateRestorationDebugLogEnabled())
    {
      ClassName = object_getClassName(v4);
      NSLog(&cfstr_SReplacingObje.isa, "-[_UIStateRestorationKeyedArchiverDelegate archiver:willEncodeObject:]", ClassName, v4);
    }
    v6 = [[_UIObjectIdentifierPathProxy alloc] initWithObject:v4];
    if (v6)
    {
      v7 = v6;
      _UIAddObjectToStateRestorationRoots(v4);
      return v7;
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

@end