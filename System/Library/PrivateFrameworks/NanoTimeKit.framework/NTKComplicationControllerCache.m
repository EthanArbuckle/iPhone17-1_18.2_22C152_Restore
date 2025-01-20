@interface NTKComplicationControllerCache
+ (id)sharedCache;
- (NTKComplicationControllerCache)init;
- (id)controllerForComplication:(id)a3 variant:(id)a4 device:(id)a5 create:(id)a6;
- (void)_cleanupRemovedFaces;
- (void)_purge;
- (void)_registerFace:(id)a3;
- (void)_removeControllersForFace:(id)a3;
- (void)_unregisterFace:(id)a3;
- (void)_updateControllersForFace:(id)a3;
- (void)dealloc;
- (void)faceCollection:(id)a3 didAddFace:(id)a4 atIndex:(unint64_t)a5;
- (void)faceCollection:(id)a3 didRemoveFace:(id)a4 atIndex:(unint64_t)a5;
- (void)faceCollectionDidLoad:(id)a3;
- (void)faceCollectionDidReset:(id)a3;
- (void)setLibraryCollection:(id)a3;
@end

@implementation NTKComplicationControllerCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_2 != -1) {
    dispatch_once(&sharedCache_onceToken_2, &__block_literal_global_138);
  }
  v2 = (void *)sharedCache___cache;

  return v2;
}

void __45__NTKComplicationControllerCache_sharedCache__block_invoke()
{
  v0 = objc_alloc_init(NTKComplicationControllerCache);
  v1 = (void *)sharedCache___cache;
  sharedCache___cache = (uint64_t)v0;
}

- (NTKComplicationControllerCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)NTKComplicationControllerCache;
  v2 = [(NTKComplicationControllerCache *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    controllers = v2->_controllers;
    v2->_controllers = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    faceToControllers = v2->_faceToControllers;
    v2->_faceToControllers = (NSMapTable *)v5;

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__purge name:*MEMORY[0x1E4F19628] object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F19628] object:0];

  v4.receiver = self;
  v4.super_class = (Class)NTKComplicationControllerCache;
  [(NTKComplicationControllerCache *)&v4 dealloc];
}

- (id)controllerForComplication:(id)a3 variant:(id)a4 device:(id)a5 create:(id)a6
{
  v10 = (void (**)(void))a6;
  v11 = +[_NTKComplicationCacheKey keyWithVariant:a4 complication:a3 forDevice:a5];
  v12 = [(NSMapTable *)self->_controllers objectForKey:v11];
  if (!v12)
  {
    v12 = v10[2](v10);
    [(NSMapTable *)self->_controllers setObject:v12 forKey:v11];
  }

  return v12;
}

- (void)setLibraryCollection:(id)a3
{
  uint64_t v5 = (NTKFaceCollection *)a3;
  libraryCollection = self->_libraryCollection;
  if (libraryCollection != v5)
  {
    [(NTKFaceCollection *)libraryCollection removeObserver:self];
    v7 = self->_libraryCollection;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__NTKComplicationControllerCache_setLibraryCollection___block_invoke;
    v9[3] = &unk_1E62C26F8;
    v9[4] = self;
    [(NTKFaceCollection *)v7 enumerateFacesUsingBlock:v9];
    objc_storeStrong((id *)&self->_libraryCollection, a3);
    [(NTKFaceCollection *)v5 addObserver:self];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__NTKComplicationControllerCache_setLibraryCollection___block_invoke_2;
    v8[3] = &unk_1E62C26F8;
    v8[4] = self;
    [(NTKFaceCollection *)v5 enumerateFacesUsingBlock:v8];
  }
}

uint64_t __55__NTKComplicationControllerCache_setLibraryCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _unregisterFace:a2];
}

uint64_t __55__NTKComplicationControllerCache_setLibraryCollection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _registerFace:a2];
}

- (void)faceCollectionDidLoad:(id)a3
{
  id v4 = a3;
  [(NTKComplicationControllerCache *)self _cleanupRemovedFaces];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__NTKComplicationControllerCache_faceCollectionDidLoad___block_invoke;
  v5[3] = &unk_1E62C26F8;
  v5[4] = self;
  [v4 enumerateFacesUsingBlock:v5];
}

uint64_t __56__NTKComplicationControllerCache_faceCollectionDidLoad___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _registerFace:a2];
}

- (void)faceCollectionDidReset:(id)a3
{
  id v4 = a3;
  [(NTKComplicationControllerCache *)self _cleanupRemovedFaces];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__NTKComplicationControllerCache_faceCollectionDidReset___block_invoke;
  v5[3] = &unk_1E62C26F8;
  v5[4] = self;
  [v4 enumerateFacesUsingBlock:v5];
}

uint64_t __57__NTKComplicationControllerCache_faceCollectionDidReset___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _registerFace:a2];
}

- (void)faceCollection:(id)a3 didAddFace:(id)a4 atIndex:(unint64_t)a5
{
}

- (void)faceCollection:(id)a3 didRemoveFace:(id)a4 atIndex:(unint64_t)a5
{
}

- (void)_registerFace:(id)a3
{
  id v4 = a3;
  [v4 addObserver:self];
  [(NTKComplicationControllerCache *)self _updateControllersForFace:v4];
}

- (void)_unregisterFace:(id)a3
{
  id v4 = a3;
  [v4 removeObserver:self];
  [(NTKComplicationControllerCache *)self _removeControllersForFace:v4];
}

- (void)_removeControllersForFace:(id)a3
{
}

- (void)_updateControllersForFace:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __60__NTKComplicationControllerCache__updateControllersForFace___block_invoke;
  v13 = &unk_1E62C18C8;
  id v14 = v4;
  id v15 = v5;
  id v6 = v5;
  id v7 = v4;
  [v7 enumerateComplicationSlotsWithBlock:&v10];
  faceToControllers = self->_faceToControllers;
  objc_super v9 = objc_msgSend(v6, "copy", v10, v11, v12, v13);
  [(NSMapTable *)faceToControllers setObject:v9 forKey:v7];
}

void __60__NTKComplicationControllerCache__updateControllersForFace___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v8 = [v3 complicationForSlot:v4];
  uint64_t v5 = [*(id *)(a1 + 32) complicationVariantForComplication:v8 withSlot:v4];

  id v6 = [*(id *)(a1 + 32) device];
  id v7 = +[NTKComplicationController controllerForComplication:v8 variant:v5 device:v6];

  [*(id *)(a1 + 40) addObject:v7];
}

- (void)_purge
{
  [(NSMapTable *)self->_controllers removeAllObjects];
  faceToControllers = self->_faceToControllers;

  [(NSMapTable *)faceToControllers removeAllObjects];
}

- (void)_cleanupRemovedFaces
{
  uint64_t v3 = [(NSMapTable *)self->_faceToControllers keyEnumerator];
  id v4 = [v3 allObjects];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__NTKComplicationControllerCache__cleanupRemovedFaces__block_invoke;
  v5[3] = &unk_1E62C8468;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __54__NTKComplicationControllerCache__cleanupRemovedFaces__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "containsFace:") & 1) == 0) {
    [*(id *)(a1 + 32) _unregisterFace:v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryCollection, 0);
  objc_storeStrong((id *)&self->_faceToControllers, 0);

  objc_storeStrong((id *)&self->_controllers, 0);
}

@end