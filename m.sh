# 1. 새로 만들 하위 폴더 이름을 변수로 지정 (원하는 이름으로 변경 가능)
SUBDIR="ming-stack"

# 2. 하위 폴더 생성
mkdir -p "$SUBDIR"

# 3. .git, . (현재), .. (상위), 그리고 새로 만든 하위 폴더를 제외한 모든 파일/폴더 이동
for file in .[^.]* *; do
    # 예외 처리: 현재폴더(.), 상위폴더(..), Git폴더(.git), 새로만든폴더($SUBDIR)는 제외
    if [ "$file" != "$SUBDIR" ] && [ "$file" != ".git" ] && [ "$file" != "." ] && [ "$file" != "m.sh" ] && [ "$file" != ".." ] && [ -e "$file" ]; then
        mv "$file" "$SUBDIR/"
    fi
done
