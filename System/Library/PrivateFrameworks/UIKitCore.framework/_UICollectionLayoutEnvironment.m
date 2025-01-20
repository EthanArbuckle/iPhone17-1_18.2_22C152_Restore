@interface _UICollectionLayoutEnvironment
- (BOOL)_wantsCollapsedTopSpacing;
- (NSCollectionLayoutContainer)container;
- (UITraitCollection)traitCollection;
- (_UICollectionLayoutEnvironment)initWithContainer:(id)a3 traitCollection:(id)a4 dataSourceSnapshot:(id)a5;
- (_UICollectionLayoutEnvironment)initWithContainer:(id)a3 traitCollection:(id)a4 dataSourceSnapshot:(id)a5 sectionIndex:(int64_t)a6 wantsCollapsedTopSpacing:(BOOL)a7;
- (_UIDataSourceSnapshotTranslating)_dataSourceSnapshot;
- (int64_t)_sectionIndex;
- (void)setContainer:(id)a3;
- (void)setTraitCollection:(id)a3;
- (void)set_dataSourceSnapshot:(id)a3;
- (void)set_sectionIndex:(int64_t)a3;
- (void)set_wantsCollapsedTopSpacing:(BOOL)a3;
@end

@implementation _UICollectionLayoutEnvironment

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (NSCollectionLayoutContainer)container
{
  return self->_container;
}

- (_UIDataSourceSnapshotTranslating)_dataSourceSnapshot
{
  return self->__dataSourceSnapshot;
}

- (_UICollectionLayoutEnvironment)initWithContainer:(id)a3 traitCollection:(id)a4 dataSourceSnapshot:(id)a5
{
  return [(_UICollectionLayoutEnvironment *)self initWithContainer:a3 traitCollection:a4 dataSourceSnapshot:a5 sectionIndex:0x7FFFFFFFFFFFFFFFLL wantsCollapsedTopSpacing:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__dataSourceSnapshot, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (_UICollectionLayoutEnvironment)initWithContainer:(id)a3 traitCollection:(id)a4 dataSourceSnapshot:(id)a5 sectionIndex:(int64_t)a6 wantsCollapsedTopSpacing:(BOOL)a7
{
  v15.receiver = self;
  v15.super_class = (Class)_UICollectionLayoutEnvironment;
  v12 = [(_UICollectionLayoutEnvironment *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_container, a3);
    objc_storeStrong((id *)&v13->_traitCollection, a4);
    objc_storeStrong((id *)&v13->__dataSourceSnapshot, a5);
    v13->__sectionIndex = a6;
    v13->__wantsCollapsedTopSpacing = a7;
  }
  return v13;
}

- (int64_t)_sectionIndex
{
  return self->__sectionIndex;
}

- (BOOL)_wantsCollapsedTopSpacing
{
  return self->__wantsCollapsedTopSpacing;
}

- (void)setContainer:(id)a3
{
}

- (void)setTraitCollection:(id)a3
{
}

- (void)set_dataSourceSnapshot:(id)a3
{
}

- (void)set_sectionIndex:(int64_t)a3
{
  self->__sectionIndex = a3;
}

- (void)set_wantsCollapsedTopSpacing:(BOOL)a3
{
  self->__wantsCollapsedTopSpacing = a3;
}

@end