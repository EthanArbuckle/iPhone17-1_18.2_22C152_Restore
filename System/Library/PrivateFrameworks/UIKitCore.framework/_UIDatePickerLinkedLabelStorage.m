@interface _UIDatePickerLinkedLabelStorage
- (BOOL)_cachedSizeForKey:(id)a3 size:(CGSize *)a4;
- (CGSize)_sizeForText:(id)a3 font:(id)a4 height:(double)a5 overrideAttributes:(id)a6;
- (_UIDatePickerLinkedLabelStorage)init;
- (unint64_t)_currentPriority;
- (void)_attachLabel:(id)a3;
- (void)_detachLabel:(id)a3;
- (void)_notifyAllLabelsExcept:(id)a3;
- (void)_resetPriority;
- (void)_setCachedSize:(CGSize)a3 forKey:(id)a4;
- (void)_setPriority:(int64_t)a3 label:(id)a4;
@end

@implementation _UIDatePickerLinkedLabelStorage

- (_UIDatePickerLinkedLabelStorage)init
{
  v10.receiver = self;
  v10.super_class = (Class)_UIDatePickerLinkedLabelStorage;
  v2 = [(_UIDatePickerLinkedLabelStorage *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    sizingLabel = v2->_sizingLabel;
    v2->_sizingLabel = (UILabel *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    attachedLabels = v2->_attachedLabels;
    v2->_attachedLabels = (NSHashTable *)v5;

    uint64_t v7 = objc_opt_new();
    sizeCache = v2->_sizeCache;
    v2->_sizeCache = (NSCache *)v7;

    [(NSCache *)v2->_sizeCache setCountLimit:40];
  }
  return v2;
}

- (void)_attachLabel:(id)a3
{
  [(NSHashTable *)self->_attachedLabels addObject:a3];
  [(_UIDatePickerLinkedLabelStorage *)self _resetPriority];
}

- (void)_detachLabel:(id)a3
{
  [(NSHashTable *)self->_attachedLabels removeObject:a3];
  [(_UIDatePickerLinkedLabelStorage *)self _resetPriority];
}

- (void)_notifyAllLabelsExcept:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_attachedLabels;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v11 + 1) + 8 * v9);
        if (v10 != v4) {
          objc_msgSend(v10, "_setNeedsStorageSync", (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_resetPriority
{
  self->_currentPriority = 0;
  [(_UIDatePickerLinkedLabelStorage *)self _notifyAllLabelsExcept:0];
}

- (void)_setPriority:(int64_t)a3 label:(id)a4
{
  if (self->_currentPriority != a3)
  {
    self->_currentPriority = a3;
    [(_UIDatePickerLinkedLabelStorage *)self _notifyAllLabelsExcept:a4];
  }
}

- (unint64_t)_currentPriority
{
  return self->_currentPriority;
}

- (CGSize)_sizeForText:(id)a3 font:(id)a4 height:(double)a5 overrideAttributes:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v13 = +[_UIDatePickerLinkedLabelCacheKey keyWithText:v10 font:v11 height:a5];
  double v19 = 0.0;
  double v20 = 0.0;
  if (![(_UIDatePickerLinkedLabelStorage *)self _cachedSizeForKey:v13 size:&v19])
  {
    long long v14 = _UIAttributedTitleForTitle(v10, v11, v12);
    [(UILabel *)self->_sizingLabel setAttributedText:v14];

    -[UILabel sizeThatFits:](self->_sizingLabel, "sizeThatFits:", INFINITY, a5);
    double v19 = v15;
    double v20 = v16;
    -[_UIDatePickerLinkedLabelStorage _setCachedSize:forKey:](self, "_setCachedSize:forKey:", v13);
  }

  double v17 = v19;
  double v18 = v20;
  result.height = v18;
  result.width = v17;
  return result;
}

- (BOOL)_cachedSizeForKey:(id)a3 size:(CGSize *)a4
{
  uint64_t v5 = [(NSCache *)self->_sizeCache objectForKey:a3];
  uint64_t v6 = v5;
  if (a4 && v5)
  {
    [v5 CGSizeValue];
    a4->width = v7;
    a4->height = v8;
  }

  return v6 != 0;
}

- (void)_setCachedSize:(CGSize)a3 forKey:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  sizeCache = self->_sizeCache;
  CGFloat v7 = (void *)MEMORY[0x1E4F29238];
  id v8 = a4;
  objc_msgSend(v7, "valueWithCGSize:", width, height);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(NSCache *)sizeCache setObject:v9 forKey:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeCache, 0);
  objc_storeStrong((id *)&self->_attachedLabels, 0);
  objc_storeStrong((id *)&self->_sizingLabel, 0);
}

@end