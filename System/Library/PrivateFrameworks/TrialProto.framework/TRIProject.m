@interface TRIProject
+ (id)descriptor;
+ (id)projectNameFromId:(unsigned int)a3;
+ (int)projectIdFromName:(id)a3;
@end

@implementation TRIProject

+ (int)projectIdFromName:(id)a3
{
  int v7 = 0;
  id v3 = a3;
  v4 = TRIProject_ProjectId_EnumDescriptor();
  int v5 = [v4 getValue:&v7 forEnumTextFormatName:v3];

  if (v5) {
    return v7;
  }
  else {
    return 0;
  }
}

+ (id)descriptor
{
  id v2 = (id)_MergedGlobals_14;
  if (!_MergedGlobals_14)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    if (!qword_1EB3EE578) {
      qword_1EB3EE578 = [[TRIPBFileDescriptor alloc] initWithPackage:@"TRI" objcPrefix:@"TRI" syntax:2];
    }
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, v8);
    if (_MergedGlobals_14) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TriprojectId.pbobjc.m", 70, @"Startup recursed!");
    }
    _MergedGlobals_14 = (uint64_t)v2;
  }
  return v2;
}

+ (id)projectNameFromId:(unsigned int)a3
{
  LODWORD(v3) = a3;
  if (TRIProject_ProjectId_IsValidValue(a3)) {
    uint64_t v3 = v3;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v6 = TRIProject_ProjectId_EnumDescriptor();
  int v7 = [v6 textFormatNameForValue:v3];

  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"TRIProject+TRI.m", 20, @"Invalid parameter not satisfying: %@", @"result" object file lineNumber description];
  }
  return v7;
}

@end