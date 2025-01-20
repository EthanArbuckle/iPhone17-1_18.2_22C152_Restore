@interface RSFloorPlan
+ (BOOL)supportsSecureCoding;
- (NSArray)curvedDoors;
- (NSArray)curvedWalls;
- (NSArray)curvedWindows;
- (NSArray)doors;
- (NSArray)floors;
- (NSArray)objects;
- (NSArray)opendoors;
- (NSArray)openings;
- (NSArray)roomTypes;
- (NSArray)walls;
- (NSArray)windows;
- (RSFloorPlan)init;
- (RSFloorPlan)initWithCoder:(id)a3;
- (RSFloorPlan)initWithDictionaryRepresentation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)storyLevel;
- (void)appendFloorPlan:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)updateObjects:(id)a3;
- (void)updateStructure:(id)a3;
- (void)writeToJson:(id)a3;
- (void)writeToObj:(id)a3;
- (void)writeToPlist:(id)a3;
@end

@implementation RSFloorPlan

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->wallLists, 0);
  objc_storeStrong((id *)&self->curvedDoors, 0);
  objc_storeStrong((id *)&self->curvedWindows, 0);
  objc_storeStrong((id *)&self->floors, 0);
  objc_storeStrong((id *)&self->roomTypes, 0);
  objc_storeStrong((id *)&self->curvedWalls, 0);
  objc_storeStrong((id *)&self->objects, 0);
  objc_storeStrong((id *)&self->opendoors, 0);
  objc_storeStrong((id *)&self->openings, 0);
  objc_storeStrong((id *)&self->windows, 0);
  objc_storeStrong((id *)&self->doors, 0);

  objc_storeStrong((id *)&self->walls, 0);
}

- (int64_t)storyLevel
{
  return self->storyLevel;
}

- (NSArray)curvedDoors
{
  return self->curvedDoors;
}

- (NSArray)curvedWindows
{
  return self->curvedWindows;
}

- (NSArray)floors
{
  return self->floors;
}

- (NSArray)roomTypes
{
  return self->roomTypes;
}

- (NSArray)curvedWalls
{
  return self->curvedWalls;
}

- (NSArray)objects
{
  return self->objects;
}

- (NSArray)opendoors
{
  return self->opendoors;
}

- (NSArray)openings
{
  return self->openings;
}

- (NSArray)windows
{
  return self->windows;
}

- (NSArray)doors
{
  return self->doors;
}

- (NSArray)walls
{
  return self->walls;
}

- (void)appendFloorPlan:(id)a3
{
  id v125 = a3;
  v8 = objc_msgSend_walls(self, v4, v5);
  if (v8)
  {
    v9 = objc_msgSend_walls(self, v6, v7);
    v12 = objc_msgSend_walls(v125, v10, v11);
    v14 = objc_msgSend_arrayByAddingObjectsFromArray_(v9, v13, (uint64_t)v12);
    sub_25B4E664C((uint64_t)self, v14);
  }
  else
  {
    v9 = objc_msgSend_walls(v125, v6, v7);
    sub_25B4E664C((uint64_t)self, v9);
  }

  v19 = objc_msgSend_doors(self, v15, v16);
  if (v19)
  {
    v20 = objc_msgSend_doors(self, v17, v18);
    v23 = objc_msgSend_doors(v125, v21, v22);
    v25 = objc_msgSend_arrayByAddingObjectsFromArray_(v20, v24, (uint64_t)v23);
    sub_25B477C30((uint64_t)self, v25);
  }
  else
  {
    v20 = objc_msgSend_doors(v125, v17, v18);
    sub_25B477C30((uint64_t)self, v20);
  }

  v30 = objc_msgSend_windows(self, v26, v27);
  if (v30)
  {
    v31 = objc_msgSend_windows(self, v28, v29);
    v34 = objc_msgSend_windows(v125, v32, v33);
    v36 = objc_msgSend_arrayByAddingObjectsFromArray_(v31, v35, (uint64_t)v34);
    sub_25B4E665C((uint64_t)self, v36);
  }
  else
  {
    v31 = objc_msgSend_windows(v125, v28, v29);
    sub_25B4E665C((uint64_t)self, v31);
  }

  v41 = objc_msgSend_openings(self, v37, v38);
  if (v41)
  {
    v42 = objc_msgSend_openings(self, v39, v40);
    v45 = objc_msgSend_openings(v125, v43, v44);
    v47 = objc_msgSend_arrayByAddingObjectsFromArray_(v42, v46, (uint64_t)v45);
    sub_25B4E666C((uint64_t)self, v47);
  }
  else
  {
    v42 = objc_msgSend_openings(v125, v39, v40);
    sub_25B4E666C((uint64_t)self, v42);
  }

  v52 = objc_msgSend_opendoors(self, v48, v49);
  if (v52)
  {
    v53 = objc_msgSend_opendoors(self, v50, v51);
    v56 = objc_msgSend_opendoors(v125, v54, v55);
    v58 = objc_msgSend_arrayByAddingObjectsFromArray_(v53, v57, (uint64_t)v56);
    sub_25B477C10((uint64_t)self, v58);
  }
  else
  {
    v53 = objc_msgSend_opendoors(v125, v50, v51);
    sub_25B477C10((uint64_t)self, v53);
  }

  v63 = objc_msgSend_curvedWalls(self, v59, v60);
  if (v63)
  {
    v64 = objc_msgSend_curvedWalls(self, v61, v62);
    v67 = objc_msgSend_curvedWalls(v125, v65, v66);
    v69 = objc_msgSend_arrayByAddingObjectsFromArray_(v64, v68, (uint64_t)v67);
    sub_25B4E667C((uint64_t)self, v69);
  }
  else
  {
    v64 = objc_msgSend_curvedWalls(v125, v61, v62);
    sub_25B4E667C((uint64_t)self, v64);
  }

  v74 = objc_msgSend_curvedDoors(self, v70, v71);
  if (v74)
  {
    v75 = objc_msgSend_curvedDoors(self, v72, v73);
    v78 = objc_msgSend_curvedDoors(v125, v76, v77);
    v80 = objc_msgSend_arrayByAddingObjectsFromArray_(v75, v79, (uint64_t)v78);
    sub_25B4E668C((uint64_t)self, v80);
  }
  else
  {
    v75 = objc_msgSend_curvedDoors(v125, v72, v73);
    sub_25B4E668C((uint64_t)self, v75);
  }

  v85 = objc_msgSend_curvedWindows(self, v81, v82);
  if (v85)
  {
    v86 = objc_msgSend_curvedWindows(self, v83, v84);
    v89 = objc_msgSend_curvedWindows(v125, v87, v88);
    v91 = objc_msgSend_arrayByAddingObjectsFromArray_(v86, v90, (uint64_t)v89);
    sub_25B4E669C((uint64_t)self, v91);
  }
  else
  {
    v86 = objc_msgSend_curvedWindows(v125, v83, v84);
    sub_25B4E669C((uint64_t)self, v86);
  }

  v96 = objc_msgSend_floors(self, v92, v93);
  if (v96)
  {
    v97 = objc_msgSend_floors(self, v94, v95);
    v100 = objc_msgSend_floors(v125, v98, v99);
    v102 = objc_msgSend_arrayByAddingObjectsFromArray_(v97, v101, (uint64_t)v100);
    sub_25B4E66AC((uint64_t)self, v102);
  }
  else
  {
    v97 = objc_msgSend_floors(v125, v94, v95);
    sub_25B4E66AC((uint64_t)self, v97);
  }

  v107 = objc_msgSend_objects(self, v103, v104);
  if (v107)
  {
    v108 = objc_msgSend_objects(self, v105, v106);
    v111 = objc_msgSend_objects(v125, v109, v110);
    v113 = objc_msgSend_arrayByAddingObjectsFromArray_(v108, v112, (uint64_t)v111);
    sub_25B477C20((uint64_t)self, v113);
  }
  else
  {
    v108 = objc_msgSend_objects(v125, v105, v106);
    sub_25B477C20((uint64_t)self, v108);
  }

  v118 = objc_msgSend_roomTypes(self, v114, v115);
  if (v118)
  {
    v119 = objc_msgSend_roomTypes(self, v116, v117);
    v122 = objc_msgSend_roomTypes(v125, v120, v121);
    v124 = objc_msgSend_arrayByAddingObjectsFromArray_(v119, v123, (uint64_t)v122);
    sub_25B4E66BC((uint64_t)self, v124);
  }
  else
  {
    v119 = objc_msgSend_roomTypes(v125, v116, v117);
    sub_25B4E66BC((uint64_t)self, v119);
  }
}

- (void)writeToPlist:(id)a3
{
  id v8 = a3;
  v6 = objc_msgSend_dictionaryRepresentation(self, v4, v5);
  objc_msgSend_writeToFile_atomically_(v6, v7, (uint64_t)v8, 1);
}

- (void)writeToJson:(id)a3
{
  id v4 = a3;
  uint64_t v7 = (char *)objc_msgSend_UTF8String(v4, v5, v6);
  sub_25B403500(__p, v7);
  sub_25B58C23C(self, (uint64_t)__p, v8);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

- (void)writeToObj:(id)a3
{
  id v4 = a3;
  uint64_t v7 = (char *)objc_msgSend_UTF8String(v4, v5, v6);
  sub_25B403500(&__p, v7);
  sub_25B58C314(self, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (RSFloorPlan)initWithCoder:(id)a3
{
  id v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)RSFloorPlan;
  uint64_t v5 = [(RSFloorPlan *)&v62 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    char v10 = objc_msgSend_setWithObjects_(v6, v9, v7, v8, 0);
    uint64_t v12 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v11, (uint64_t)v10, @"walls");
    walls = v5->walls;
    v5->walls = (NSArray *)v12;

    uint64_t v15 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v10, @"openings");
    openings = v5->openings;
    v5->openings = (NSArray *)v15;

    uint64_t v18 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v17, (uint64_t)v10, @"windows");
    windows = v5->windows;
    v5->windows = (NSArray *)v18;

    uint64_t v21 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v20, (uint64_t)v10, @"doors");
    doors = v5->doors;
    v5->doors = (NSArray *)v21;

    uint64_t v24 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v10, @"open_doors");
    opendoors = v5->opendoors;
    v5->opendoors = (NSArray *)v24;

    v26 = (void *)MEMORY[0x263EFFA08];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    v30 = objc_msgSend_setWithObjects_(v26, v29, v27, v28, 0);
    uint64_t v32 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v31, (uint64_t)v30, @"objects");
    objects = v5->objects;
    v5->objects = (NSArray *)v32;

    v34 = (void *)MEMORY[0x263EFFA08];
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    uint64_t v38 = objc_msgSend_setWithObjects_(v34, v37, v35, v36, 0);
    uint64_t v40 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v39, (uint64_t)v38, @"curved_walls");
    curvedWalls = v5->curvedWalls;
    v5->curvedWalls = (NSArray *)v40;

    v42 = (void *)MEMORY[0x263EFFA08];
    uint64_t v43 = objc_opt_class();
    uint64_t v44 = objc_opt_class();
    v46 = objc_msgSend_setWithObjects_(v42, v45, v43, v44, 0);
    uint64_t v48 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v47, (uint64_t)v46, @"room_types");
    roomTypes = v5->roomTypes;
    v5->roomTypes = (NSArray *)v48;

    uint64_t v51 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v50, (uint64_t)v10, @"floors");
    floors = v5->floors;
    v5->floors = (NSArray *)v51;

    uint64_t v54 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v53, (uint64_t)v38, @"curved_windows");
    curvedWindows = v5->curvedWindows;
    v5->curvedWindows = (NSArray *)v54;

    uint64_t v57 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v56, (uint64_t)v38, @"curved_doors");
    curvedDoors = v5->curvedDoors;
    v5->curvedDoors = (NSArray *)v57;

    sub_25B4E6BB0((uint64_t)v5, v59, v60);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  objc_msgSend_encodeObject_forKey_(v15, v4, (uint64_t)self->walls, @"walls");
  objc_msgSend_encodeObject_forKey_(v15, v5, (uint64_t)self->openings, @"openings");
  objc_msgSend_encodeObject_forKey_(v15, v6, (uint64_t)self->windows, @"windows");
  objc_msgSend_encodeObject_forKey_(v15, v7, (uint64_t)self->doors, @"doors");
  objc_msgSend_encodeObject_forKey_(v15, v8, (uint64_t)self->opendoors, @"open_doors");
  objc_msgSend_encodeObject_forKey_(v15, v9, (uint64_t)self->objects, @"objects");
  objc_msgSend_encodeObject_forKey_(v15, v10, (uint64_t)self->curvedWalls, @"curved_walls");
  objc_msgSend_encodeObject_forKey_(v15, v11, (uint64_t)self->roomTypes, @"room_types");
  objc_msgSend_encodeObject_forKey_(v15, v12, (uint64_t)self->floors, @"floors");
  objc_msgSend_encodeObject_forKey_(v15, v13, (uint64_t)self->curvedWindows, @"curved_windows");
  objc_msgSend_encodeObject_forKey_(v15, v14, (uint64_t)self->curvedDoors, @"curved_doors");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(RSFloorPlan);
  id v5 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v7 = objc_msgSend_initWithArray_copyItems_(v5, v6, (uint64_t)self->walls, 1);
  walls = v4->walls;
  v4->walls = (NSArray *)v7;

  id v9 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v11 = objc_msgSend_initWithArray_copyItems_(v9, v10, (uint64_t)self->windows, 1);
  windows = v4->windows;
  v4->windows = (NSArray *)v11;

  id v13 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v15 = objc_msgSend_initWithArray_copyItems_(v13, v14, (uint64_t)self->doors, 1);
  doors = v4->doors;
  v4->doors = (NSArray *)v15;

  id v17 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v19 = objc_msgSend_initWithArray_copyItems_(v17, v18, (uint64_t)self->openings, 1);
  openings = v4->openings;
  v4->openings = (NSArray *)v19;

  id v21 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v23 = objc_msgSend_initWithArray_copyItems_(v21, v22, (uint64_t)self->opendoors, 1);
  opendoors = v4->opendoors;
  v4->opendoors = (NSArray *)v23;

  v4->groupId = self->groupId;
  v4->ceilingHeight = self->ceilingHeight;
  v4->floorHeight = self->floorHeight;
  id v25 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v27 = objc_msgSend_initWithArray_copyItems_(v25, v26, (uint64_t)self->objects, 1);
  objects = v4->objects;
  v4->objects = (NSArray *)v27;

  id v29 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v31 = objc_msgSend_initWithArray_copyItems_(v29, v30, (uint64_t)self->curvedWalls, 1);
  curvedWalls = v4->curvedWalls;
  v4->curvedWalls = (NSArray *)v31;

  id v33 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v35 = objc_msgSend_initWithArray_copyItems_(v33, v34, (uint64_t)self->roomTypes, 1);
  roomTypes = v4->roomTypes;
  v4->roomTypes = (NSArray *)v35;

  id v37 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v39 = objc_msgSend_initWithArray_copyItems_(v37, v38, (uint64_t)self->floors, 1);
  floors = v4->floors;
  v4->floors = (NSArray *)v39;

  id v41 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v43 = objc_msgSend_initWithArray_copyItems_(v41, v42, (uint64_t)self->curvedWindows, 1);
  curvedWindows = v4->curvedWindows;
  v4->curvedWindows = (NSArray *)v43;

  id v45 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v47 = objc_msgSend_initWithArray_copyItems_(v45, v46, (uint64_t)self->curvedDoors, 1);
  curvedDoors = v4->curvedDoors;
  v4->curvedDoors = (NSArray *)v47;

  return v4;
}

- (void)updateStructure:(id)a3
{
  id v44 = a3;
  objc_msgSend_walls(v44, v4, v5);
  uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  walls = self->walls;
  self->walls = v6;

  objc_msgSend_openings(v44, v8, v9);
  char v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  openings = self->openings;
  self->openings = v10;

  objc_msgSend_windows(v44, v12, v13);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  windows = self->windows;
  self->windows = v14;

  objc_msgSend_doors(v44, v16, v17);
  uint64_t v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  doors = self->doors;
  self->doors = v18;

  objc_msgSend_opendoors(v44, v20, v21);
  uint64_t v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
  opendoors = self->opendoors;
  self->opendoors = v22;

  objc_msgSend_curvedWalls(v44, v24, v25);
  v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
  curvedWalls = self->curvedWalls;
  self->curvedWalls = v26;

  objc_msgSend_roomTypes(v44, v28, v29);
  v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
  roomTypes = self->roomTypes;
  self->roomTypes = v30;

  objc_msgSend_floors(v44, v32, v33);
  v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
  floors = self->floors;
  self->floors = v34;

  objc_msgSend_curvedWindows(v44, v36, v37);
  uint64_t v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
  curvedWindows = self->curvedWindows;
  self->curvedWindows = v38;

  objc_msgSend_curvedDoors(v44, v40, v41);
  v42 = (NSArray *)objc_claimAutoreleasedReturnValue();
  curvedDoors = self->curvedDoors;
  self->curvedDoors = v42;
}

- (void)updateObjects:(id)a3
{
  id v8 = a3;
  uint64_t v6 = (NSArray *)objc_msgSend_copy(v8, v4, v5);
  objects = self->objects;
  self->objects = v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  v65[0] = @"walls";
  uint64_t v60 = sub_25B4E77AC(self->walls, 0);
  v66[0] = v60;
  v65[1] = @"doors";
  v56 = sub_25B4E77AC(self->doors, 2);
  v66[1] = v56;
  v65[2] = @"windows";
  uint64_t v57 = sub_25B4E77AC(self->windows, 1);
  v66[2] = v57;
  v65[3] = @"openings";
  v58 = sub_25B4E77AC(self->openings, 3);
  v66[3] = v58;
  v65[4] = @"open_doors";
  v59 = sub_25B4E77AC(self->opendoors, 4);
  v66[4] = v59;
  v65[5] = @"objects";
  v3 = self->objects;
  uint64_t v6 = v3;
  if (v3 && objc_msgSend_count(v3, v4, v5))
  {
    uint64_t v9 = (void *)MEMORY[0x263EFF980];
    uint64_t v10 = objc_msgSend_count(v6, v7, v8);
    uint64_t v12 = objc_msgSend_arrayWithCapacity_(v9, v11, v10);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v13 = v6;
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v61, v67, 16);
    if (v17)
    {
      uint64_t v18 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v62 != v18) {
            objc_enumerationMutation(v13);
          }
          v20 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v61 + 1) + 8 * i), v15, v16);
          objc_msgSend_addObject_(v12, v21, (uint64_t)v20);
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v61, v67, 16);
      }
      while (v17);
    }

    uint64_t v24 = objc_msgSend_copy(v12, v22, v23);
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x263EFFA68];
  }

  v66[5] = v24;
  v65[6] = @"curved_walls";
  uint64_t v25 = sub_25B4E7980(self->curvedWalls, 0);
  v66[6] = v25;
  v65[7] = @"room_types";
  v26 = self->roomTypes;
  uint64_t v29 = v26;
  if (v26 && objc_msgSend_count(v26, v27, v28))
  {
    uint64_t v32 = (void *)MEMORY[0x263EFF980];
    uint64_t v33 = objc_msgSend_count(v29, v30, v31);
    uint64_t v35 = objc_msgSend_arrayWithCapacity_(v32, v34, v33);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v36 = v29;
    uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v61, v67, 16);
    if (v40)
    {
      uint64_t v41 = *(void *)v62;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v62 != v41) {
            objc_enumerationMutation(v36);
          }
          uint64_t v43 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v61 + 1) + 8 * j), v38, v39);
          objc_msgSend_addObject_(v35, v44, (uint64_t)v43);
        }
        uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v38, (uint64_t)&v61, v67, 16);
      }
      while (v40);
    }

    uint64_t v47 = objc_msgSend_copy(v35, v45, v46);
  }
  else
  {
    uint64_t v47 = (void *)MEMORY[0x263EFFA68];
  }

  v66[7] = v47;
  v65[8] = @"floors";
  uint64_t v48 = sub_25B4E77AC(self->floors, 5);
  v66[8] = v48;
  v65[9] = @"curved_windows";
  uint64_t v49 = sub_25B4E7980(self->curvedWindows, 1);
  v66[9] = v49;
  v65[10] = @"curved_doors";
  v50 = sub_25B4E7980(self->curvedDoors, 2);
  v66[10] = v50;
  v65[11] = @"story";
  v52 = objc_msgSend_numberWithInteger_(NSNumber, v51, self->storyLevel);
  v66[11] = v52;
  uint64_t v54 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v53, (uint64_t)v66, v65, 12);

  return v54;
}

- (RSFloorPlan)initWithDictionaryRepresentation:(id)a3
{
  return (RSFloorPlan *)sub_25B4E7B60(self, a3, 0);
}

- (RSFloorPlan)init
{
  v48.receiver = self;
  v48.super_class = (Class)RSFloorPlan;
  id v4 = [(RSFloorPlan *)&v48 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF8C0], v2, v3);
    walls = v4->walls;
    v4->walls = (NSArray *)v5;

    uint64_t v9 = objc_msgSend_array(MEMORY[0x263EFF8C0], v7, v8);
    openings = v4->openings;
    v4->openings = (NSArray *)v9;

    uint64_t v13 = objc_msgSend_array(MEMORY[0x263EFF8C0], v11, v12);
    windows = v4->windows;
    v4->windows = (NSArray *)v13;

    uint64_t v17 = objc_msgSend_array(MEMORY[0x263EFF8C0], v15, v16);
    doors = v4->doors;
    v4->doors = (NSArray *)v17;

    uint64_t v21 = objc_msgSend_array(MEMORY[0x263EFF8C0], v19, v20);
    opendoors = v4->opendoors;
    v4->opendoors = (NSArray *)v21;

    uint64_t v25 = objc_msgSend_array(MEMORY[0x263EFF8C0], v23, v24);
    objects = v4->objects;
    v4->objects = (NSArray *)v25;

    uint64_t v29 = objc_msgSend_array(MEMORY[0x263EFF8C0], v27, v28);
    curvedWalls = v4->curvedWalls;
    v4->curvedWalls = (NSArray *)v29;

    uint64_t v33 = objc_msgSend_array(MEMORY[0x263EFF8C0], v31, v32);
    roomTypes = v4->roomTypes;
    v4->roomTypes = (NSArray *)v33;

    uint64_t v37 = objc_msgSend_array(MEMORY[0x263EFF8C0], v35, v36);
    floors = v4->floors;
    v4->floors = (NSArray *)v37;

    uint64_t v41 = objc_msgSend_array(MEMORY[0x263EFF8C0], v39, v40);
    curvedWindows = v4->curvedWindows;
    v4->curvedWindows = (NSArray *)v41;

    uint64_t v45 = objc_msgSend_array(MEMORY[0x263EFF8C0], v43, v44);
    curvedDoors = v4->curvedDoors;
    v4->curvedDoors = (NSArray *)v45;

    *(void *)&v4->groupId = 0;
    *(void *)&v4->floorHeight = 0;
    *(void *)v4->translationXYZ = 0;
    *(void *)&v4->translationXYZ[8] = 0;
    v4->storyLevel = 0;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end