@interface _UICollectionViewListCellVisualProvider_iOS
- (void)configureFocusedFloatingContentView:(id)a3;
@end

@implementation _UICollectionViewListCellVisualProvider_iOS

- (void)configureFocusedFloatingContentView:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"_UICollectionViewListCellVisualProvider.m" lineNumber:61 description:@"Floating Content View is not supported on iOS"];
}

@end