@interface SSItemImageCollection
- (NSArray)itemImages;
- (SSItemImageCollection)initWithImageCollection:(id)a3;
- (SSItemImageCollection)initWithItemImages:(id)a3;
- (SSItemImageCollection)initWithXPCEncoding:(id)a3;
- (id)_imagesForSize:(CGSize)a3 scale:(double)a4;
- (id)_newImagesForDictionary:(id)a3;
- (id)bestImageForSize:(CGSize)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)imagesForKind:(id)a3;
- (id)imagesForSize:(CGSize)a3;
- (void)dealloc;
@end

@implementation SSItemImageCollection

- (SSItemImageCollection)initWithImageCollection:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      a3 = (id)[MEMORY[0x1E4F1C978] arrayWithObject:a3];
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = [(SSItemImageCollection *)self _newImagesForDictionary:v9];
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v19;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v19 != v13) {
                  objc_enumerationMutation(v10);
                }
                [v4 addObject:*(void *)(*((void *)&v18 + 1) + 8 * v14++)];
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }
            while (v12);
          }
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }
  v15 = [(SSItemImageCollection *)self initWithItemImages:v4];

  return v15;
}

- (SSItemImageCollection)initWithItemImages:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSItemImageCollection;
  id v4 = [(SSItemImageCollection *)&v6 init];
  if (v4) {
    v4->_itemImages = (NSArray *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSItemImageCollection;
  [(SSItemImageCollection *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5[1] = [(NSArray *)self->_itemImages copyWithZone:a3];
  return v5;
}

- (id)bestImageForSize:(CGSize)a3
{
  id v3 = -[SSItemImageCollection imagesForSize:](self, "imagesForSize:", a3.width, a3.height);
  id result = (id)[v3 count];
  if (result)
  {
    return (id)[v3 lastObject];
  }
  return result;
}

- (id)imagesForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  GSMainScreenScaleFactor();
  objc_msgSend(v6, "addObjectsFromArray:", -[SSItemImageCollection _imagesForSize:scale:](self, "_imagesForSize:scale:", width, height, v7));
  if (![v6 count]) {
    objc_msgSend(v6, "addObjectsFromArray:", -[SSItemImageCollection _imagesForSize:scale:](self, "_imagesForSize:scale:", width, height, 0.0));
  }
  uint64_t v8 = objc_msgSend((id)objc_msgSend(v6, "allObjects"), "sortedArrayUsingFunction:context:", __ImageSizeSort, 0);

  return v8;
}

- (id)imagesForKind:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  GSMainScreenScaleFactor();
  float v8 = v7;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  itemImages = self->_itemImages;
  uint64_t v10 = [(NSArray *)itemImages countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    double v12 = v8;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(itemImages);
        }
        v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v15, "imageKind"), "isEqualToString:", a3))
        {
          [v15 imageScale];
          if (v16 == v12) {
            [v6 addObject:v15];
          }
          [v5 addObject:v15];
        }
      }
      uint64_t v11 = [(NSArray *)itemImages countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
  if ([v6 count]) {
    v17 = v6;
  }
  else {
    v17 = v5;
  }
  return (id)[v17 sortedArrayUsingFunction:__ImageSizeSort context:0];
}

- (id)_imagesForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  float v8 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  itemImages = self->_itemImages;
  uint64_t v10 = [(NSArray *)itemImages countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v51 != v12) {
          objc_enumerationMutation(itemImages);
        }
        uint64_t v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        [v14 imageSize];
        if (width == v16 && height == v15)
        {
          if (a4 < 0.00000011920929 || ([v14 imageScale], v18 == a4)) {
            [v8 addObject:v14];
          }
        }
      }
      uint64_t v11 = [(NSArray *)itemImages countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v11);
  }
  if (![v8 count])
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v19 = self->_itemImages;
    uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v47 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          [v24 imageSize];
          if (SSItemImageSizeEqualToSize(width, height, v25, v26))
          {
            if (a4 < 0.00000011920929 || ([v24 imageScale], v27 == a4)) {
              [v8 addObject:v24];
            }
          }
        }
        uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v21);
    }
  }
  if (![v8 count])
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v29 = self->_itemImages;
    uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v42 objects:v54 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      v32 = 0;
      uint64_t v33 = *(void *)v43;
      double v34 = 1.79769313e308;
      double v35 = width / height;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v43 != v33) {
            objc_enumerationMutation(v29);
          }
          v37 = *(void **)(*((void *)&v42 + 1) + 8 * k);
          if (a4 >= 0.00000011920929)
          {
            [*(id *)(*((void *)&v42 + 1) + 8 * k) imageScale];
            if (v38 != a4) {
              continue;
            }
          }
          [v37 imageSize];
          double v41 = vabdd_f64(v35, v39 / v40);
          if (v41 < v34)
          {
            v32 = v37;
            double v34 = v41;
          }
        }
        uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v42 objects:v54 count:16];
      }
      while (v31);
      if (v32) {
        [v8 addObject:v32];
      }
    }
  }
  return v8;
}

- (id)_newImagesForDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [a3 objectForKey:@"image-type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v11 = [a3 objectForKey:v10];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = [[SSItemArtworkImage alloc] initWithArtworkDictionary:v11];
            if ([(SSItemArtworkImage *)v12 URLString])
            {
              [(SSItemArtworkImage *)v12 setImageKindWithTypeName:v5 variantName:v10];
              [v4 addObject:v12];
            }
          }
        }
        uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v13 = [[SSItemArtworkImage alloc] initWithArtworkDictionary:a3];
    if ([(SSItemArtworkImage *)v13 URLString]) {
      [v4 addObject:v13];
    }
  }
  return v4;
}

- (SSItemImageCollection)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v15.receiver = self;
    v15.super_class = (Class)SSItemImageCollection;
    uint64_t v5 = [(SSItemImageCollection *)&v15 init];
    if (v5)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      xpc_object_t value = xpc_dictionary_get_value(a3, "0");
      if (value)
      {
        uint64_t v9 = value;
        if (MEMORY[0x1A62689E0]() == MEMORY[0x1E4F14568])
        {
          int64_t count = xpc_array_get_count(v9);
          if (count >= 1)
          {
            int64_t v11 = count;
            for (size_t i = 0; i != v11; ++i)
            {
              uint64_t v13 = [[SSItemArtworkImage alloc] initWithXPCEncoding:xpc_array_get_value(v9, i)];
              if (v13)
              {
                uint64_t v14 = v13;
                [v7 addObject:v13];
              }
            }
          }
        }
      }
      v5->_itemImages = (NSArray *)[v7 copy];
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)copyXPCEncoding
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v4 = xpc_array_create(0, 0);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  itemImages = self->_itemImages;
  uint64_t v6 = [(NSArray *)itemImages countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(itemImages);
        }
        uint64_t v10 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v9) copyXPCEncoding];
        if (v10)
        {
          int64_t v11 = v10;
          xpc_array_append_value(v4, v10);
          xpc_release(v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)itemImages countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  xpc_dictionary_set_value(v3, "0", v4);
  xpc_release(v4);
  return v3;
}

- (NSArray)itemImages
{
  return self->_itemImages;
}

@end