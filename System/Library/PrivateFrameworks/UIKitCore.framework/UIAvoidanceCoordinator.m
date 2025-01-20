@interface UIAvoidanceCoordinator
- (CGRect)avoidanceFrame;
- (UIAvoidanceCoordinator)init;
- (id)findBlockadesForName:(id)a3;
- (id)findClientsForBlockade:(id)a3;
- (id)findNamesForBlockade:(id)a3;
- (void)addAvoidanceObject:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)releaseAll:(id)a3 withType:(unint64_t)a4;
- (void)removeAvoidanceObject:(id)a3;
- (void)setAvoidanceFrame:(CGRect)a3;
- (void)setGroupOfBlockades:(id)a3 forBlockadeIdentifier:(id)a4;
- (void)updateClients:(id)a3;
@end

@implementation UIAvoidanceCoordinator

- (UIAvoidanceCoordinator)init
{
  v8.receiver = self;
  v8.super_class = (Class)UIAvoidanceCoordinator;
  v2 = [(UIAvoidanceCoordinator *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    blockades = v2->_blockades;
    v2->_blockades = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    clients = v2->_clients;
    v2->_clients = (NSMutableSet *)v5;
  }
  return v2;
}

- (void)releaseAll:(id)a3 withType:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __46__UIAvoidanceCoordinator_releaseAll_withType___block_invoke;
        v12[3] = &unk_1E530F068;
        v12[4] = self;
        ForPropertiesMatchingType(a4, v11, v12);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

uint64_t __46__UIAvoidanceCoordinator_releaseAll_withType___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 removeObserver:*(void *)(a1 + 32) forKeyPath:a3 context:a4];
}

- (void)dealloc
{
  [(UIAvoidanceCoordinator *)self releaseAll:self->_blockades withType:1];
  [(UIAvoidanceCoordinator *)self releaseAll:self->_clients withType:2];
  v3.receiver = self;
  v3.super_class = (Class)UIAvoidanceCoordinator;
  [(UIAvoidanceCoordinator *)&v3 dealloc];
}

- (void)setGroupOfBlockades:(id)a3 forBlockadeIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_blockades objectForKey:v6];
  if (v8)
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"A blockade already exists with the name '%@', unable to create group", v6 format];
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Expected NSArray, got %@", objc_opt_class() format];
    }
    [(NSMutableDictionary *)self->_blockades setObject:v8 forKeyedSubscript:v6];
  }
  else if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Blockade name '%@' is not a group", v6 format];
    }
    [(NSMutableDictionary *)self->_blockades removeObjectForKey:v6];
  }
}

- (void)addAvoidanceObject:(id)a3
{
  id v4 = a3;
  uint64_t Type = FindType(v4);
  uint64_t v6 = Type;
  if (Type)
  {
    if (Type)
    {
      id v7 = v4;
      blockades = self->_blockades;
      uint64_t v9 = [v7 blockadeIdentifier];
      uint64_t v10 = [(NSMutableDictionary *)blockades objectForKey:v9];

      if (v10)
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __45__UIAvoidanceCoordinator_addAvoidanceObject___block_invoke;
        v19[3] = &unk_1E530F068;
        v19[4] = self;
        ForPropertiesMatchingType(1, v10, v19);
      }
      uint64_t v11 = [v7 blockadeIdentifier];
      if (v11
        && (v12 = (void *)v11,
            [v7 blockadeIdentifier],
            long long v13 = objc_claimAutoreleasedReturnValue(),
            char v14 = [v13 isEqualToString:&stru_1ED0E84C0],
            v13,
            v12,
            (v14 & 1) == 0))
      {
        long long v15 = self->_blockades;
        long long v16 = [v7 blockadeIdentifier];
        [(NSMutableDictionary *)v15 setObject:v7 forKey:v16];
      }
      else
      {
        v6 &= 2u;
      }
    }
    if ((v6 & 2) != 0)
    {
      if ([(NSMutableSet *)self->_clients containsObject:v4])
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __45__UIAvoidanceCoordinator_addAvoidanceObject___block_invoke_2;
        v18[3] = &unk_1E530F068;
        v18[4] = self;
        ForPropertiesMatchingType(2, v4, v18);
      }
      else
      {
        [(NSMutableSet *)self->_clients addObject:v4];
      }
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Object %@ must conform to at least one of UIAvoidanceBlockade, UIAvoidanceClient", v4 format];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __45__UIAvoidanceCoordinator_addAvoidanceObject___block_invoke_3;
  v17[3] = &unk_1E530F068;
  v17[4] = self;
  ForPropertiesMatchingType(v6, v4, v17);
}

uint64_t __45__UIAvoidanceCoordinator_addAvoidanceObject___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 removeObserver:*(void *)(a1 + 32) forKeyPath:a3 context:a4];
}

uint64_t __45__UIAvoidanceCoordinator_addAvoidanceObject___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 removeObserver:*(void *)(a1 + 32) forKeyPath:a3 context:a4];
}

uint64_t __45__UIAvoidanceCoordinator_addAvoidanceObject___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 addObserver:*(void *)(a1 + 32) forKeyPath:a3 options:7 context:a4];
}

- (void)removeAvoidanceObject:(id)a3
{
  id v4 = a3;
  uint64_t Type = FindType(v4);
  uint64_t v6 = Type;
  if (Type)
  {
    id v7 = v4;
    blockades = self->_blockades;
    uint64_t v9 = [v7 blockadeIdentifier];
    uint64_t v10 = [(NSMutableDictionary *)blockades objectForKey:v9];

    if (v10)
    {
      uint64_t v11 = self->_blockades;
      v12 = [v7 blockadeIdentifier];
      [(NSMutableDictionary *)v11 removeObjectForKey:v12];
    }
    else
    {
      v6 &= 2u;
    }

    if ((v6 & 2) == 0)
    {
LABEL_3:
      if (!v6) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
  }
  else if ((Type & 2) == 0)
  {
    goto LABEL_3;
  }
  if ([(NSMutableSet *)self->_clients containsObject:v4])
  {
    [(NSMutableSet *)self->_clients removeObject:v4];
  }
  else
  {
    v6 &= ~2uLL;
    if (!v6) {
      goto LABEL_14;
    }
  }
LABEL_12:
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__UIAvoidanceCoordinator_removeAvoidanceObject___block_invoke;
  v15[3] = &unk_1E530F068;
  v15[4] = self;
  ForPropertiesMatchingType(v6, v4, v15);
  if (v6)
  {
    long long v13 = [v4 blockadeIdentifier];
    char v14 = [(UIAvoidanceCoordinator *)self findClientsForBlockade:v13];
    [(UIAvoidanceCoordinator *)self updateClients:v14];
  }
LABEL_14:
}

uint64_t __48__UIAvoidanceCoordinator_removeAvoidanceObject___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 removeObserver:*(void *)(a1 + 32) forKeyPath:a3 context:a4];
}

- (id)findNamesForBlockade:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] setWithObject:v4];
  id v6 = v4;
  id v7 = 0;
  v17 = v6;
  while (2)
  {
    id v8 = v7;
    id v7 = v6;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = self->_blockades;
    uint64_t v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        char v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
        long long v15 = [(NSMutableDictionary *)self->_blockades objectForKey:v14];
        if (([v15 conformsToProtocol:&unk_1ED701C00] & 1) == 0
          && ([v15 containsObject:v7] & 1) != 0)
        {
          break;
        }

        if (v11 == ++v13)
        {
          uint64_t v11 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_14;
        }
      }
      [v5 addObject:v14];
      id v6 = v14;

      if (v6) {
        continue;
      }
    }
    else
    {
LABEL_14:
    }
    break;
  }

  return v5;
}

- (id)findClientsForBlockade:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && ![v4 isEqualToString:&stru_1ED0E84C0])
  {
    v17 = v5;
    id v7 = [(UIAvoidanceCoordinator *)self findNamesForBlockade:v5];
    id v6 = [MEMORY[0x1E4F1CA80] set];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = self->_clients;
    uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v13 conformsToProtocol:&unk_1ED701C60])
          {
            char v14 = [v13 blockades];
            int v15 = [v7 intersectsSet:v14];

            if (v15) {
              [v6 addObject:v13];
            }
          }
        }
        uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    uint64_t v5 = v17;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v6;
}

- (id)findBlockadesForName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  id v6 = [MEMORY[0x1E4F1CA48] arrayWithObject:v4];
  while ([v6 count])
  {
    id v7 = [v6 lastObject];
    [v6 removeLastObject];
    id v8 = [(NSMutableDictionary *)self->_blockades objectForKey:v7];
    if ([v8 conformsToProtocol:&unk_1ED701C00]) {
      [v5 addObject:v8];
    }
    else {
      [v6 addObjectsFromArray:v8];
    }
  }
  return v5;
}

- (void)updateClients:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int recurseCount = self->_recurseCount;
  if (recurseCount <= 10)
  {
    self->_int recurseCount = recurseCount + 1;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    obuint64_t j = v4;
    uint64_t v27 = [v4 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v27)
    {
      uint64_t v26 = *(void *)v42;
      uint64_t v24 = *MEMORY[0x1E4F1C3C8];
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = v6;
          id v7 = *(void **)(*((void *)&v41 + 1) + 8 * v6);
          v32 = [MEMORY[0x1E4F1CA60] dictionary];
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          v28 = v7;
          id v30 = [v7 blockades];
          uint64_t v8 = [v30 countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v31 = *(void *)v38;
            do
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                if (*(void *)v38 != v31) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v11 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                uint64_t v12 = self;
                uint64_t v13 = [(UIAvoidanceCoordinator *)self findBlockadesForName:v11];
                char v14 = [MEMORY[0x1E4F1CA80] set];
                long long v33 = 0u;
                long long v34 = 0u;
                long long v35 = 0u;
                long long v36 = 0u;
                id v15 = v13;
                uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v45 count:16];
                if (v16)
                {
                  uint64_t v17 = v16;
                  uint64_t v18 = *(void *)v34;
                  do
                  {
                    for (uint64_t j = 0; j != v17; ++j)
                    {
                      if (*(void *)v34 != v18) {
                        objc_enumerationMutation(v15);
                      }
                      long long v20 = [*(id *)(*((void *)&v33 + 1) + 8 * j) blockadeShapes];
                      [v14 unionSet:v20];
                    }
                    uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v45 count:16];
                  }
                  while (v17);
                }

                [v32 setObject:v14 forKey:v11];
                self = v12;
              }
              uint64_t v9 = [v30 countByEnumeratingWithState:&v37 objects:v46 count:16];
            }
            while (v9);
          }

          long long v21 = [v28 avoidanceApplicator];
          if (!v21) {
            [MEMORY[0x1E4F1CA00] raise:v24, @"Client %@ needs an applicator", v28 format];
          }
          v22 = [v28 avoidanceController];
          uint64_t v23 = [v22 avoid:v32 forClient:v28 withCoordinator:self];
          [v21 updateClient:v28 toPosition:v23];

          uint64_t v6 = v29 + 1;
        }
        while (v29 + 1 != v27);
        uint64_t v27 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v27);
    }
    --self->_recurseCount;
    id v4 = obj;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v24 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if ((char *)a6 - 3 < (char *)4)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
    [(UIAvoidanceCoordinator *)self updateClients:v13];

    goto LABEL_20;
  }
  if (a6 == (void *)1)
  {
    uint64_t v16 = [v11 objectForKey:*MEMORY[0x1E4F284E0]];
    if (v16)
    {
      id v15 = [(UIAvoidanceCoordinator *)self findClientsForBlockade:v16];
      [(NSMutableDictionary *)self->_blockades removeObjectForKey:v16];
    }
    else
    {
      id v15 = 0;
    }
    uint64_t v17 = [v12 objectForKey:*MEMORY[0x1E4F284C8]];
    if (v17)
    {
      uint64_t v18 = [(UIAvoidanceCoordinator *)self findClientsForBlockade:v17];
      [(NSMutableDictionary *)self->_blockades setObject:v10 forKeyedSubscript:v17];
      id v19 = v15;
      id v20 = v18;
      long long v21 = v20;
      if (!v19)
      {
        id v23 = v20;
        goto LABEL_18;
      }
      if (v20)
      {
        v22 = (void *)[v19 mutableCopy];
        [v22 intersectSet:v21];
        id v23 = (id)[v19 mutableCopy];
        [v23 unionSet:v21];
        [v23 minusSet:v22];

LABEL_18:
        [(UIAvoidanceCoordinator *)self updateClients:v23];

        goto LABEL_19;
      }
    }
    else if (!v15)
    {
      long long v21 = 0;
      id v23 = 0;
      goto LABEL_18;
    }
    id v23 = v15;
    long long v21 = 0;
    goto LABEL_18;
  }
  if (a6 != (void *)2)
  {
    NSLog(&cfstr_UnknownContext.isa, a6);
    goto LABEL_20;
  }
  char v14 = [v10 blockadeIdentifier];
  id v15 = [(UIAvoidanceCoordinator *)self findClientsForBlockade:v14];

  [(UIAvoidanceCoordinator *)self updateClients:v15];
LABEL_19:

LABEL_20:
}

- (CGRect)avoidanceFrame
{
  double x = self->_avoidanceFrame.origin.x;
  double y = self->_avoidanceFrame.origin.y;
  double width = self->_avoidanceFrame.size.width;
  double height = self->_avoidanceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAvoidanceFrame:(CGRect)a3
{
  self->_avoidanceFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_blockades, 0);
}

@end