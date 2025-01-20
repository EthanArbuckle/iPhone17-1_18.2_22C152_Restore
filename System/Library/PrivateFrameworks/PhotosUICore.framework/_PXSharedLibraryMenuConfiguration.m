@interface _PXSharedLibraryMenuConfiguration
- (PXMenuBuilder)extraItemsMenuBuilder;
- (_PXSharedLibraryMenuConfiguration)initWithMenuBuilder:(id)a3;
@end

@implementation _PXSharedLibraryMenuConfiguration

- (void).cxx_destruct
{
}

- (PXMenuBuilder)extraItemsMenuBuilder
{
  return self->_extraItemsMenuBuilder;
}

- (_PXSharedLibraryMenuConfiguration)initWithMenuBuilder:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSharedLibraryUtilities.m", 2043, @"Invalid parameter not satisfying: %@", @"menuBuilder != nil" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)_PXSharedLibraryMenuConfiguration;
  v7 = [(_PXSharedLibraryMenuConfiguration *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_extraItemsMenuBuilder, a3);
  }

  return v8;
}

@end