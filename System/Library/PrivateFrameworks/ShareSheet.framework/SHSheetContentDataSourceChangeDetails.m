@interface SHSheetContentDataSourceChangeDetails
- (BOOL)airDropBadgeChanged;
- (BOOL)animateDifferences;
- (BOOL)forceReload;
- (BOOL)peopleCountChanged;
- (BOOL)sectionsChanged;
- (BOOL)snapshotChanged;
- (NSArray)modifiedIdentifiers;
- (id)description;
- (void)setAirDropBadgeChanged:(BOOL)a3;
- (void)setAnimateDifferences:(BOOL)a3;
- (void)setForceReload:(BOOL)a3;
- (void)setModifiedIdentifiers:(id)a3;
- (void)setPeopleCountChanged:(BOOL)a3;
- (void)setSectionsChanged:(BOOL)a3;
- (void)setSnapshotChanged:(BOOL)a3;
@end

@implementation SHSheetContentDataSourceChangeDetails

- (id)description
{
  v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)SHSheetContentDataSourceChangeDetails;
  v4 = [(SHSheetContentDataSourceChangeDetails *)&v14 description];
  [(SHSheetContentDataSourceChangeDetails *)self snapshotChanged];
  v5 = NSStringFromBOOL();
  [(SHSheetContentDataSourceChangeDetails *)self airDropBadgeChanged];
  v6 = NSStringFromBOOL();
  [(SHSheetContentDataSourceChangeDetails *)self sectionsChanged];
  v7 = NSStringFromBOOL();
  [(SHSheetContentDataSourceChangeDetails *)self peopleCountChanged];
  v8 = NSStringFromBOOL();
  [(SHSheetContentDataSourceChangeDetails *)self forceReload];
  v9 = NSStringFromBOOL();
  [(SHSheetContentDataSourceChangeDetails *)self animateDifferences];
  v10 = NSStringFromBOOL();
  v11 = [(SHSheetContentDataSourceChangeDetails *)self modifiedIdentifiers];
  v12 = [v3 stringWithFormat:@"<%@ snapshotChanged:%@ airDropBadgeChanged:%@ sectionsChanged:%@ peopleCountChanged:%@ forceReload:%@ animateDifferences:%@ modifiedIdentifiers:%@>", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (BOOL)snapshotChanged
{
  return self->_snapshotChanged;
}

- (void)setSnapshotChanged:(BOOL)a3
{
  self->_snapshotChanged = a3;
}

- (BOOL)forceReload
{
  return self->_forceReload;
}

- (void)setForceReload:(BOOL)a3
{
  self->_forceReload = a3;
}

- (BOOL)animateDifferences
{
  return self->_animateDifferences;
}

- (void)setAnimateDifferences:(BOOL)a3
{
  self->_animateDifferences = a3;
}

- (BOOL)airDropBadgeChanged
{
  return self->_airDropBadgeChanged;
}

- (void)setAirDropBadgeChanged:(BOOL)a3
{
  self->_airDropBadgeChanged = a3;
}

- (BOOL)sectionsChanged
{
  return self->_sectionsChanged;
}

- (void)setSectionsChanged:(BOOL)a3
{
  self->_sectionsChanged = a3;
}

- (BOOL)peopleCountChanged
{
  return self->_peopleCountChanged;
}

- (void)setPeopleCountChanged:(BOOL)a3
{
  self->_peopleCountChanged = a3;
}

- (NSArray)modifiedIdentifiers
{
  return self->_modifiedIdentifiers;
}

- (void)setModifiedIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end