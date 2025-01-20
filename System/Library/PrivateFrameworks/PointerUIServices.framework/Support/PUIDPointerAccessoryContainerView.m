@interface PUIDPointerAccessoryContainerView
- (id)_visibleShapeViewAtPosition:(id)a3;
- (id)_visibleShapeViewForAccessory:(id)a3;
- (void)_recordAccessory:(id)a3 withShapeView:(id)a4;
- (void)_removeRecordOfAccessory:(id)a3;
- (void)setAccessories:(id)a3 animated:(BOOL)a4;
@end

@implementation PUIDPointerAccessoryContainerView

- (void)setAccessories:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v57 = self;
  p_accessories = &self->_accessories;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v48 = v6;
    objc_storeStrong((id *)p_accessories, a3);
    if (!v57->_shapeViewsByPosition && [v6 count])
    {
      uint64_t v8 = +[NSMutableDictionary dictionary];
      shapeViewsByPosition = v57->_shapeViewsByPosition;
      v57->_shapeViewsByPosition = (NSMutableDictionary *)v8;

      uint64_t v10 = +[NSMutableDictionary dictionary];
      shapeViewsByAccessory = v57->_shapeViewsByAccessory;
      v57->_shapeViewsByAccessory = (NSMutableDictionary *)v10;
    }
    v12 = +[NSMutableDictionary dictionary];
    id v13 = [(NSMutableDictionary *)v57->_shapeViewsByAccessory mutableCopy];
    objc_initWeak(&location, v57);
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_10001B9BC;
    v76[3] = &unk_100045258;
    objc_copyWeak(&v79, &location);
    id v49 = v13;
    id v77 = v49;
    id v52 = v12;
    id v78 = v52;
    v55 = objc_retainBlock(v76);
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v14 = v6;
    id v15 = [v14 countByEnumeratingWithState:&v72 objects:v86 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v73;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v73 != v16) {
            objc_enumerationMutation(v14);
          }
          v18 = *(void **)(*((void *)&v72 + 1) + 8 * (void)v17);
          v19 = [(PUIDPointerAccessoryContainerView *)v57 _visibleShapeViewForAccessory:v18];
          if (v19)
          {
            id v20 = v18;
LABEL_14:
            ((void (*)(void *, void *, void *, id))v55[2])(v55, v19, v18, v20);
            goto LABEL_15;
          }
          v21 = [v18 positionRecordKey];
          v19 = [(PUIDPointerAccessoryContainerView *)v57 _visibleShapeViewAtPosition:v21];

          if (v19)
          {
            v22 = [(NSMutableDictionary *)v57->_shapeViewsByAccessory allKeysForObject:v19];
            id v20 = [v22 firstObject];

            goto LABEL_14;
          }
          id v20 = 0;
LABEL_15:

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v23 = [v14 countByEnumeratingWithState:&v72 objects:v86 count:16];
        id v15 = v23;
      }
      while (v23);
    }

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id obj = v14;
    id v53 = [obj countByEnumeratingWithState:&v68 objects:v85 count:16];
    if (!v53) {
      goto LABEL_46;
    }
    uint64_t v51 = *(void *)v69;
LABEL_21:
    uint64_t v56 = 0;
    while (1)
    {
      if (*(void *)v69 != v51) {
        objc_enumerationMutation(obj);
      }
      v58 = *(void **)(*((void *)&v68 + 1) + 8 * v56);
      v24 = objc_msgSend(v52, "objectForKeyedSubscript:");

      if (v24) {
        goto LABEL_44;
      }
      v54 = +[PUIDPointerDomain rootSettings];
      if (![v54 allowPositionToPositionAnimations]) {
        goto LABEL_41;
      }
      long long v67 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v64 = 0u;
      v25 = [v49 allKeys];
      v26 = 0;
      id v27 = [v25 countByEnumeratingWithState:&v64 objects:v84 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v65;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v65 != v28) {
              objc_enumerationMutation(v25);
            }
            id v30 = *(id *)(*((void *)&v64 + 1) + 8 * i);
            id v31 = v58;
            v32 = [v30 shape];
            v33 = [v31 shape];
            unsigned int v34 = [v32 isEqual:v33];

            if (v34)
            {
              [v30 angle];
              [v31 angle];
            }

            if (BSFloatLessThanFloat())
            {
              id v35 = v30;

              v26 = v35;
            }
          }
          id v27 = [v25 countByEnumeratingWithState:&v64 objects:v84 count:16];
        }
        while (v27);
      }

      [v54 positionToPositionAnimationThreshold];
      BSDegreesToRadians();
      if (!BSFloatLessThanOrEqualToFloat()) {
        break;
      }
      v36 = [v49 objectForKeyedSubscript:v26];
      if (!v36) {
        goto LABEL_42;
      }
LABEL_43:
      ((void (*)(void *, PUIDPointerShapeView *, void *, void *))v55[2])(v55, v36, v58, v26);

LABEL_44:
      if ((id)++v56 == v53)
      {
        id v53 = [obj countByEnumeratingWithState:&v68 objects:v85 count:16];
        if (!v53)
        {
LABEL_46:

          v44 = +[PUIDPointerDomain rootSettings];
          v45 = [v44 pointerAccessoryAnimationSettings];

          v62[0] = _NSConcreteStackBlock;
          v62[1] = 3221225472;
          v62[2] = sub_10001BB54;
          v62[3] = &unk_100045280;
          id v46 = v45;
          id v63 = v46;
          [v52 enumerateKeysAndObjectsUsingBlock:v62];
          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472;
          v59[2] = sub_10001BC8C;
          v59[3] = &unk_1000452D0;
          id v47 = v46;
          id v60 = v47;
          v61 = v57;
          [v49 enumerateKeysAndObjectsUsingBlock:v59];

          objc_destroyWeak(&v79);
          objc_destroyWeak(&location);

          id v6 = v48;
          goto LABEL_47;
        }
        goto LABEL_21;
      }
    }

LABEL_41:
    v26 = 0;
LABEL_42:
    id v37 = v58;
    v38 = [PUIDPointerShapeView alloc];
    v39 = [v37 shape];
    [v39 bounds];
    v40 = -[PUIDPointerShapeView initWithFrame:](v38, "initWithFrame:");

    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_10001C078;
    v81[3] = &unk_100044C88;
    v41 = v40;
    v82 = v41;
    id v83 = v37;
    id v42 = v37;
    +[UIView performWithoutAnimation:v81];
    v43 = v83;
    v36 = v41;

    goto LABEL_43;
  }
LABEL_47:
}

- (id)_visibleShapeViewForAccessory:(id)a3
{
  return [(NSMutableDictionary *)self->_shapeViewsByAccessory objectForKeyedSubscript:a3];
}

- (id)_visibleShapeViewAtPosition:(id)a3
{
  return [(NSMutableDictionary *)self->_shapeViewsByPosition objectForKeyedSubscript:a3];
}

- (void)_recordAccessory:(id)a3 withShapeView:(id)a4
{
  shapeViewsByAccessory = self->_shapeViewsByAccessory;
  id v7 = a4;
  id v8 = a3;
  [(NSMutableDictionary *)shapeViewsByAccessory setObject:v7 forKeyedSubscript:v8];
  shapeViewsByPosition = self->_shapeViewsByPosition;
  id v10 = [v8 positionRecordKey];

  [(NSMutableDictionary *)shapeViewsByPosition setObject:v7 forKeyedSubscript:v10];
}

- (void)_removeRecordOfAccessory:(id)a3
{
  shapeViewsByAccessory = self->_shapeViewsByAccessory;
  id v5 = a3;
  [(NSMutableDictionary *)shapeViewsByAccessory removeObjectForKey:v5];
  shapeViewsByPosition = self->_shapeViewsByPosition;
  id v7 = [v5 positionRecordKey];

  [(NSMutableDictionary *)shapeViewsByPosition removeObjectForKey:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeViewsByAccessory, 0);
  objc_storeStrong((id *)&self->_shapeViewsByPosition, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
}

@end