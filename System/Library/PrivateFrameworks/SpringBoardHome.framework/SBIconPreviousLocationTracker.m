@interface SBIconPreviousLocationTracker
- (SBHIconModel)iconModel;
- (id)previousLocationInfoForIcon:(id)a3;
- (void)captureLocationInfoForIcon:(id)a3 inModel:(id)a4;
- (void)setIconModel:(id)a3;
@end

@implementation SBIconPreviousLocationTracker

- (void)captureLocationInfoForIcon:(id)a3 inModel:(id)a4
{
  id v14 = a3;
  v6 = [a4 rootFolder];
  v7 = [v6 indexPathForIcon:v14];
  if (v7)
  {
    uint64_t v8 = [v6 folderContainingIndexPath:v7 relativeIndexPath:0];
    v9 = (void *)v8;
    if (v8 && (void *)v8 != v6)
    {
      if (!self->_previousIconLocations)
      {
        v10 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
        previousIconLocations = self->_previousIconLocations;
        self->_previousIconLocations = v10;
      }
      v12 = objc_alloc_init(SBIconPreviousLocationInfo);
      [(SBIconPreviousLocationInfo *)v12 setFolder:v9];
      v13 = [v9 displayName];
      [(SBIconPreviousLocationInfo *)v12 setFolderName:v13];

      [(NSMapTable *)self->_previousIconLocations setObject:v12 forKey:v14];
    }
  }
  else
  {
    v9 = 0;
  }
}

- (id)previousLocationInfoForIcon:(id)a3
{
  return [(NSMapTable *)self->_previousIconLocations objectForKey:a3];
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (void)setIconModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_previousIconLocations, 0);
}

@end