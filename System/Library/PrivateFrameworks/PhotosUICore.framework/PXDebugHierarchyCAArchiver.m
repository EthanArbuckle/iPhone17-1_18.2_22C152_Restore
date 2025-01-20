@interface PXDebugHierarchyCAArchiver
+ (BOOL)archiveDebugHierarchyWithIdentifier:(id)a3 provider:(id)a4 toURL:(id)a5 error:(id *)a6;
@end

@implementation PXDebugHierarchyCAArchiver

+ (BOOL)archiveDebugHierarchyWithIdentifier:(id)a3 provider:(id)a4 toURL:(id)a5 error:(id *)a6
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  v10 = +[PXDebugHierarchyCALayerObjectsBuilder buildLayerTreeForDebugHierarchyWithIdentifier:a3 provider:a4 options:0];
  v15 = @"rootLayer";
  v16[0] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:0];
  [v12 encodeObject:v11 forKey:@"root"];
  v13 = [v12 encodedData];
  LOBYTE(a6) = [v13 writeToURL:v9 options:0 error:a6];

  return (char)a6;
}

@end